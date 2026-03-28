package ui;
import functions.AdminFunctions;
import javafx.application.Application;
import javafx.geometry.Insets;
import javafx.geometry.Pos;
import javafx.scene.Scene;
import javafx.scene.control.*;
import javafx.scene.layout.*;
import javafx.stage.Stage;

public class AdminUI extends Application {

    private Label messageLabel;

    @Override
    public void start(Stage primaryStage) {
        primaryStage.setTitle("Horse Racing - Admin");

        TabPane tabPane = new TabPane();
        tabPane.setTabClosingPolicy(TabPane.TabClosingPolicy.UNAVAILABLE);
        tabPane.setStyle("-fx-background-color: #e3f2fd;");
        tabPane.setTabMinWidth(100);
        tabPane.setTabMaxWidth(200);
        tabPane.setStyle("-fx-background-color: #e3f2fd; -fx-alignment: center;");
        Tab addRaceTab = createAddRaceTab();
        Tab deleteOwnerTab = createDeleteOwnerTab();
        Tab moveHorseTab = createMoveHorseTab();
        Tab approveTrainerTab = createApproveTrainerTab();

        tabPane.getTabs().addAll(addRaceTab, deleteOwnerTab, moveHorseTab, approveTrainerTab);

        messageLabel = new Label("Welcome");
        messageLabel.setStyle("-fx-text-fill: #e3f2fd; -fx-font-weight: bold; -fx-font-size: 14px;");
        VBox mainLayout = new VBox(20);
        mainLayout.setAlignment(Pos.CENTER);
        mainLayout.setPadding(new Insets(25));
        mainLayout.setStyle("-fx-background-color: linear-gradient(to bottom right, #e3f2fd, #bbdefb);");
        mainLayout.getChildren().addAll(tabPane, messageLabel);
        Scene scene = new Scene(mainLayout, 700, 500);
        primaryStage.setScene(scene);
        primaryStage.show();
    }

    private Tab createAddRaceTab() {
        Tab tab = new Tab("Add New Race");
        GridPane grid = createGrid();

        TextField raceIdField = new TextField();
        TextField raceNameField = new TextField();
        TextField trackNameField = new TextField();
        TextField raceDateField = new TextField();
        TextField raceTimeField = new TextField();

        grid.add(new Label("Race ID:"), 0, 0);
        grid.add(raceIdField, 1, 0);
        grid.add(new Label("Race name:"), 0, 1);
        grid.add(raceNameField, 1, 1);
        grid.add(new Label("Track name:"), 0, 2);
        grid.add(trackNameField, 1, 2);
        grid.add(new Label("Race date in (YYYY-MM-DD):"), 0, 3);
        grid.add(raceDateField, 1, 3);
        grid.add(new Label("Race time in (HH:MM:SS):"), 0, 4);
        grid.add(raceTimeField, 1, 4);
        Button addButton = createMainButton("Add race");
        addButton.setOnAction(e -> {
            String raceId = raceIdField.getText();
            String raceName = raceNameField.getText();
            String trackName = trackNameField.getText();
            String raceDate = raceDateField.getText();
            String raceTime = raceTimeField.getText();

            if (raceId.isEmpty() || raceName.isEmpty() || trackName.isEmpty() ||
                    raceDate.isEmpty() || raceTime.isEmpty()) {
                showMessage("You should fill all fields", "red");
                return;
            }

            boolean success = AdminFunctions.addNewRace(raceId, raceName, trackName, raceDate, raceTime);
            if (success) {
                showMessage("Race added successfully !", "green");
                raceIdField.clear();
                raceNameField.clear();
                trackNameField.clear();
                raceDateField.clear();
                raceTimeField.clear();
            } else {
                showMessage("Failed to add race", "red");
            }
        });

        VBox tabContent = createCenteredBox(grid, addButton);
        tab.setContent(tabContent);
        return tab;
    }

    private Tab createDeleteOwnerTab() {
        Tab tab = new Tab("Delete owner");
        GridPane grid = createGrid();

        TextField ownerIdField = new TextField();

        grid.add(new Label("Owner ID:"), 0, 0);
        grid.add(ownerIdField, 1, 0);

        Button deleteButton = createMainButton("Delete owner");
        deleteButton.setOnAction(e -> {
            String ownerId = ownerIdField.getText();

            if (ownerId.isEmpty()) {
                showMessage("enter Owner ID", "red");
                return;
            }

            if (!AdminFunctions.checkId("Owner", "ownerId", ownerId)) {
                showMessage("Owner ID does not exist", "red");
                return;
            }

            Alert confirmAlert = new Alert(Alert.AlertType.CONFIRMATION);
            confirmAlert.setTitle("Confirm deletion");
            confirmAlert.setHeaderText("Delete owner");
            confirmAlert.setContentText("Are you sure you want to delete " + ownerId + "?");

            if (confirmAlert.showAndWait().get() == ButtonType.OK) {
                boolean success = AdminFunctions.deleteOwner(ownerId);
                if (success) {
                    showMessage("Owner deleted", "green");
                    ownerIdField.clear();
                } else {
                    showMessage("Failed to delete owner", "red");
                }
            }
        });

        VBox tabContent = createCenteredBox(grid, deleteButton);
        tab.setContent(tabContent);
        return tab;
    }

    private Tab createMoveHorseTab() {
        Tab tab = new Tab("Move horse");
        GridPane grid = createGrid();

        TextField horseIdField = new TextField();
        TextField newStableIdField = new TextField();

        grid.add(new Label("Horse ID:"), 0, 0);
        grid.add(horseIdField, 1, 0);
        grid.add(new Label("New stable ID:"), 0, 1);
        grid.add(newStableIdField, 1, 1);

        Button moveButton = createMainButton("Move horse");
        moveButton.setOnAction(e -> {
            String horseId = horseIdField.getText();
            String newStableId = newStableIdField.getText();

            if (horseId.isEmpty() || newStableId.isEmpty()) {
                showMessage("you should fill both fields", "red");
                return;
            }

            if (!AdminFunctions.checkId("Horse", "horseId", horseId)) {
                showMessage("horse ID does not exist", "red");
                return;
            }

            if (!AdminFunctions.checkId("Stable", "stableId", newStableId)) {
                showMessage("stable ID does not exist", "red");
                return;
            }

            boolean success = AdminFunctions.moveHorse(horseId, newStableId);
            if (success) {
                showMessage("Horse moved successfully", "green");
                horseIdField.clear();
                newStableIdField.clear();
            } else {
                showMessage("Failed - horse not moved", "red");
            }
        });

        VBox tabContent = createCenteredBox(grid, moveButton);
        tab.setContent(tabContent);
        return tab;
    }

    private Tab createApproveTrainerTab() {
        Tab tab = new Tab("Approve trainer");
        GridPane grid = createGrid();

        TextField trainerIdField = new TextField();
        TextField firstNameField = new TextField();
        TextField lastNameField = new TextField();
        TextField stableIdField = new TextField();

        grid.add(new Label("Trainer ID:"), 0, 0);
        grid.add(trainerIdField, 1, 0);
        grid.add(new Label("First Name:"), 0, 1);
        grid.add(firstNameField, 1, 1);
        grid.add(new Label("Last Name:"), 0, 2);
        grid.add(lastNameField, 1, 2);
        grid.add(new Label("Stable ID:"), 0, 3);
        grid.add(stableIdField, 1, 3);

        Button approveButton = createMainButton("Approve trainer");
        approveButton.setOnAction(e -> {
            String trainerId = trainerIdField.getText();
            String firstName = firstNameField.getText();
            String lastName = lastNameField.getText();
            String stableId = stableIdField.getText();

            if (trainerId.isEmpty() || firstName.isEmpty() || lastName.isEmpty() || stableId.isEmpty()) {
                showMessage("you should fill all fields", "red");
                return;
            }

            if (!AdminFunctions.checkId("Stable", "stableId", stableId)) {
                showMessage("Stable ID does not exist", "red");
                return;
            }

            boolean success = AdminFunctions.approveTrainer(trainerId, firstName, lastName, stableId);
            if (success) {
                showMessage("Trainer approved !", "green");
                trainerIdField.clear();
                firstNameField.clear();
                lastNameField.clear();
                stableIdField.clear();
            } else {
                showMessage("Failed to approve trainer", "red");
            }
        });

        VBox tabContent = createCenteredBox(grid, approveButton);
        tab.setContent(tabContent);
        return tab;
    }

    private GridPane createGrid() {
        GridPane grid = new GridPane();
        grid.setPadding(new Insets(15));
        grid.setVgap(12);
        grid.setHgap(15);
        grid.setAlignment(Pos.CENTER);
        grid.setStyle("-fx-background-color: #e3f2fd; -fx-border-color: #90caf9; -fx-border-radius: 10; -fx-background-radius: 10;");
        return grid;
    }

    private Button createMainButton(String text) {
        Button button = new Button(text);
        button.setStyle("-fx-background-color: #1976d2; -fx-text-fill: white; -fx-font-weight: bold; -fx-background-radius: 8;");
        return button;
    }

    private VBox createCenteredBox(GridPane grid, Button button) {
        VBox box = new VBox(20);
        box.setAlignment(Pos.CENTER);
        box.setPadding(new Insets(25));
        box.getChildren().addAll(grid, button);
        return box;
    }

    private void showMessage(String message, String color) {
        messageLabel.setText(message);
        if (color.equals("green")) {
            messageLabel.setStyle("-fx-text-fill: #2e7d32; -fx-font-weight: bold;");
        } else if (color.equals("red")) {
            messageLabel.setStyle("-fx-text-fill: #c62828; -fx-font-weight: bold;");
        } else {
            messageLabel.setStyle("-fx-text-fill: black; -fx-font-weight: bold;");
        }
    }

    public static void main(String[] args) {
        launch(args);
    }
}
