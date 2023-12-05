/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author HELLO
 */
public class StudentAttendance {
     private int studentId;
        private String studentName;
        private int totalPresent;
        private int totalAbsent;
        private String sessionIds;
        private String absentSessionIds;
        private double absenceRate;

    public double getAbsenceRate() {
        return absenceRate;
    }

    public void setAbsenceRate(double absenceRate) {
        this.absenceRate = absenceRate;
    }

    public StudentAttendance(int studentId, String studentName, int totalPresent, int totalAbsent, String sessionIds, String absentSessionIds, double absenceRate) {
        this.studentId = studentId;
        this.studentName = studentName;
        this.totalPresent = totalPresent;
        this.totalAbsent = totalAbsent;
        this.sessionIds = sessionIds;
        this.absentSessionIds = absentSessionIds;
        this.absenceRate = absenceRate;
    }

    public String getAbsentSessionIds() {
        return absentSessionIds;
    }

    public void setAbsentSessionIds(String absentSessionIds) {
        this.absentSessionIds = absentSessionIds;
    }

    public StudentAttendance(int studentId, String studentName, int totalPresent, int totalAbsent, String sessionIds, String absentSessionIds) {
        this.studentId = studentId;
        this.studentName = studentName;
        this.totalPresent = totalPresent;
        this.totalAbsent = totalAbsent;
        this.sessionIds = sessionIds;
        this.absentSessionIds = absentSessionIds;
    }
        
        

    public StudentAttendance() {
    }

    public StudentAttendance(int studentId, String studentName, int totalPresent, int totalAbsent, String sessionIds) {
        this.studentId = studentId;
        this.studentName = studentName;
        this.totalPresent = totalPresent;
        this.totalAbsent = totalAbsent;
        this.sessionIds = sessionIds;
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

    public String getSessionIds() {
        return sessionIds;
    }

    public void setSessionIds(String sessionIds) {
        this.sessionIds = sessionIds;
    }
        
        
}
