/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author HELLO
 */
public class AttendanceReport {

    private int studentId;
    private String studentName;
    private int totalPresent;
    private int totalAbsent;

    // Constructors
    public AttendanceReport() {
    }

    public AttendanceReport(int studentId, String studentName, int totalPresent, int totalAbsent) {
        this.studentId = studentId;
        this.studentName = studentName;
        this.totalPresent = totalPresent;
        this.totalAbsent = totalAbsent;
    }

    // Getters and Setters
    public int getStudentId() {
        return studentId;
    }

    public void setStudentId(int studentId) {
        this.studentId = studentId;
    }

    public String getStudentName() {
        return studentName;
    }

    public void setStudentName(String studentName) {
        this.studentName = studentName;
    }

    public int getTotalPresent() {
        return totalPresent;
    }

    public void setTotalPresent(int totalPresent) {
        this.totalPresent = totalPresent;
    }

    public int getTotalAbsent() {
        return totalAbsent;
    }

    public void setTotalAbsent(int totalAbsent) {
        this.totalAbsent = totalAbsent;
    }
}
