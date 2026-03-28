package ui;

import javafx.application.Application;
import javafx.geometry.Insets;
import javafx.geometry.Pos;
import javafx.scene.Scene;
import javafx.scene.control.Button;
import javafx.scene.control.Label;
import javafx.scene.layout.VBox;
import javafx.stage.Stage;

public class Main extends Application {

    @Override
    public void start(Stage primaryStage) {
        primaryStage.setTitle("Horse Racing System");

        VBox vbox = new VBox(30);
        vbox.setPadding(new Insets(40));
        vbox.setAlignment(Pos.CENTER);
        vbox.setStyle("-fx-background-color: linear-gradient(to bottom, #e3f2fd, #bbdefb);");

        Label titlel = new Label("🐎 Horse Racing 🐎");
        titlel.setStyle("-fx-font-size: 24px; -fx-font-weight: bold; -fx-text-fill: #1565c0;");

        Button adminb = new Button("Admin Login");
        Button guestb = new Button("Continue as Guest");
        adminb.setStyle("-fx-background-color: #1976d2; -fx-text-fill: white; -fx-font-size: 16px; -fx-pref-width: 200px;");
        guestb.setStyle("-fx-background-color: #388e3c; -fx-text-fill: white; -fx-font-size: 16px; -fx-pref-width: 200px;");

        adminb.setOnAction(e -> {
            AdminUI adminUI = new AdminUI();
            adminUI.start(new Stage());
            primaryStage.close();
        });

        guestb.setOnAction(e -> {
            GuestUI guestUI = new GuestUI();
            guestUI.start(new Stage());
            primaryStage.close();
        });

        vbox.getChildren().addAll(titlel, adminb, guestb);

        Scene s = new Scene(vbox, 600, 500);
        primaryStage.setScene(s);
        primaryStage.show();
    }

    public static void main(String[] args) {
        launch(args);
    }
}