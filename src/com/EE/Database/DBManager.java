package com.EE.Database;

import java.sql.*;
import java.util.ArrayList;

public class DBManager {
    private static Connection connection;
    static{
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/test?useUnicode=true&serverTimezone=UTC","root","");

        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
    public static void addUser(User user){
    }
    public static ArrayList<User> getUsers() throws SQLException {
        ArrayList<User> users = new ArrayList<>();
        PreparedStatement statement = connection.prepareStatement("" +
                "SELECT * FROM users");
        ResultSet resultSet = statement.executeQuery();
        while(resultSet.next()){
            users.add(new User(
                    resultSet.getLong("id"),
                    resultSet.getString("name"),
                    resultSet.getString("surname"),
                    resultSet.getInt("age")
            ));
        }
        statement.close();
        return users;
    }
    public static User getUserByID(Long id) throws SQLException {
        User user = null;
        PreparedStatement statement = connection.prepareStatement("" +
                "SELECT * FROM users where id = "+id);
        ResultSet resultSet = statement.executeQuery();
        if (resultSet.next()){
            user = new User(
                    id,
                    resultSet.getString("name"),
                    resultSet.getString("surname"),
                    resultSet.getInt("age")
                    );
        }
        return user;
    }
    public static void editUser(User user) throws SQLException {
        PreparedStatement statement = connection.prepareStatement("" +
                "UPDATE users SET name = ?, surname = ?, age = ? WHERE id = ?");
        statement.setString(1,user.getName());
        statement.setString(2,user.getSurname());
        statement.setInt(3,user.getAge());
        statement.setLong(4,user.getId());
        statement.executeUpdate();
    }
}
