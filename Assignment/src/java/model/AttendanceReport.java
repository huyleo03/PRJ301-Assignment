/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

import java.sql.Date;

/**
 *
 * @author HELLO
 */
public class AttendanceReport {

    private int studentId;
    private String studentName;
    private int sessionId;
    private Date date;
    private String status;
    private int totalPresent;
    private int totalAbsent;

    // Constructors
    public AttendanceReport() {
    }

    public AttendanceReport(int studentId, String studentName, int sessionId, Date date, String status, int totalPresent, int totalAbsent) {
        this.studentId = studentId;
        this.studentName = studentName;
        this.sessionId = sessionId;
        this.date = date;
        this.status = status;
        this.totalPresent = totalPresent;
        this.totalAbsent = totalAbsent;
    }

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

    public int getSessionId() {
        return sessionId;
    }

    public void setSessionId(int sessionId) {
        this.sessionId = sessionId;
    }

    public Date getDate() {
        return date;
    }

    public void setDate(Date date) {
        this.date = date;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
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
