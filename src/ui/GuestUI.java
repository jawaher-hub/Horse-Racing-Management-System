package ui;

import javafx.application.Application;
import javafx.beans.property.SimpleObjectProperty;
import javafx.collections.FXCollections;
import javafx.collections.ObservableList;
import javafx.geometry.Insets;
import javafx.scene.Scene;
import javafx.scene.control.*;
import javafx.scene.layout.*;
import javafx.stage.Stage;
import java.sql.*;

public class GuestUI extends Application {
    private Connection conn;

    @Override
    public void start(Stage stage) {
        try {
            conn = DriverManager.getConnection(
                    "jdbc:mysql://localhost:3306/HorseRacing", "root", "1234");
        } catch (SQLException e) {
            new Alert(Alert.AlertType.ERROR, "Database connection failed: " + e.getMessage(), ButtonType.OK).showAndWait();
            return;
        }

        TabPane tabs = new TabPane();
        tabs.getTabs().add(tabHorsesByOwner());
        tabs.getTabs().add(tabWinningTrainers());
        tabs.getTabs().add(tabTrainerWinnings());
        tabs.getTabs().add(tabTrackStats());

        Scene scene = new Scene(tabs, 600, 500);
        stage.setTitle("Horse Racing – Guest");
        stage.setScene(scene);
        stage.show();

    }

    private Tab tabHorsesByOwner() {
        Tab tab = new Tab("Horses by Owner"); tab.setClosable(false);
        VBox root = new VBox(10); root.setPadding(new Insets(10));
        HBox bar = new HBox(10);
        TextField tf = new TextField(); tf.setPromptText("Owner last name (e.g. Mohammed)");
        Button btn = new Button("Search");
        bar.getChildren().addAll(new Label("Owner last name:"), tf, btn);

        TableView<ObservableList<Object>> table = new TableView<>();
        btn.setOnAction(e -> {
            String sql = """
                SELECT h.horseName AS Horse, h.age AS Age,
                       t.fname AS TrainerFirst, t.lname AS TrainerLast
                FROM Horse h
                JOIN Owns o   ON o.horseId = h.horseId
                JOIN Owner ow ON ow.ownerId = o.ownerId
                JOIN Trainer t ON t.stableId = h.stableId
                WHERE ow.lname = ?
            """;
            runToTable(table, sql, ps -> ps.setString(1, tf.getText().trim()));
        });
        root.getChildren().addAll(bar, table); tab.setContent(root); return tab;
    }

    private Tab tabWinningTrainers() {
        Tab tab = new Tab("Trainers with Winning Horses"); tab.setClosable(false);
        VBox root = new VBox(10); root.setPadding(new Insets(10));
        Button btn = new Button("Load Data");
        TableView<ObservableList<Object>> table = new TableView<>();
        btn.setOnAction(e -> {
            String sql = """
                SELECT DISTINCT t.fname AS TrainerFirst, t.lname AS TrainerLast,
                                h.horseName AS Horse, r.raceName AS Race
                FROM Trainer t
                JOIN Horse h        ON h.stableId = t.stableId
                JOIN RaceResults rr ON rr.horseId = h.horseId
                JOIN Race r         ON r.raceId   = rr.raceId
                WHERE rr.results = 'first'
            """;
            runToTable(table, sql, null);
        });
        root.getChildren().addAll(btn, table); tab.setContent(root); return tab;
    }

    private Tab tabTrainerWinnings() {
        Tab tab = new Tab("Trainer Winnings"); tab.setClosable(false);
        VBox root = new VBox(10); root.setPadding(new Insets(10));
        Button btn = new Button("Load Data");
        TableView<ObservableList<Object>> table = new TableView<>();
        btn.setOnAction(e -> {
            String sql = """
                SELECT t.fname AS TrainerFirst, t.lname AS TrainerLast,
                       SUM(rr.prize) AS TotalWinnings
                FROM Trainer t
                JOIN Horse h ON h.stableId = t.stableId
                JOIN RaceResults rr ON rr.horseId = h.horseId
                GROUP BY t.trainerId, t.fname, t.lname
                ORDER BY TotalWinnings DESC
            """;
            runToTable(table, sql, null);
        });
        root.getChildren().addAll(btn, table); tab.setContent(root); return tab;
    }

    private Tab tabTrackStats() {
        Tab tab = new Tab("Track Stats"); tab.setClosable(false);
        VBox root = new VBox(10); root.setPadding(new Insets(10));
        Button btn = new Button("Load Data");
        TableView<ObservableList<Object>> table = new TableView<>();
        btn.setOnAction(e -> {
            String sql = """
                SELECT tr.trackName AS Track,
                       COUNT(DISTINCT ra.raceId)  AS RaceCount,
                       COUNT(DISTINCT rr.horseId) AS TotalHorses
                FROM Track tr
                JOIN Race ra        ON ra.trackName = tr.trackName
                JOIN RaceResults rr ON rr.raceId    = ra.raceId
                GROUP BY tr.trackName
            """;
            runToTable(table, sql, null);
        });
        root.getChildren().addAll(btn, table); tab.setContent(root); return tab;
    }

    private interface Binder { void bind(PreparedStatement ps) throws SQLException; }

    private void runToTable(TableView<ObservableList<Object>> table, String sql, Binder binder) {
        table.getItems().clear(); table.getColumns().clear();
        try (PreparedStatement ps = conn.prepareStatement(sql)) {
            if (binder != null) binder.bind(ps);
            try (ResultSet rs = ps.executeQuery()) {
                ResultSetMetaData meta = rs.getMetaData();
                int colCount = meta.getColumnCount();
                for (int i = 1; i <= colCount; i++) {
                    final int colIndex = i - 1;
                    TableColumn<ObservableList<Object>, Object> col = new TableColumn<>(meta.getColumnLabel(i));
                    col.setCellValueFactory(data -> new SimpleObjectProperty<>(data.getValue().get(colIndex)));
                    col.setPrefWidth(180);
                    table.getColumns().add(col);
                }
                ObservableList<ObservableList<Object>> rows = FXCollections.observableArrayList();
                while (rs.next()) {
                    ObservableList<Object> row = FXCollections.observableArrayList();
                    for (int i = 1; i <= colCount; i++) row.add(rs.getObject(i));
                    rows.add(row);
                }
                table.setItems(rows);
            }
        } catch (SQLException ex) {
            new Alert(Alert.AlertType.ERROR, ex.getMessage(), ButtonType.OK).showAndWait();
        }
    }


    @Override public void stop() throws Exception {
        super.stop();
        if (conn != null) try { conn.close(); } catch (SQLException ignored) {}
    }
}