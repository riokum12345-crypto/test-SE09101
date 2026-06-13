package com.studentmanagement.controller;

import com.studentmanagement.entity.Student;
import com.studentmanagement.service.StudentService;
import lombok.RequiredArgsConstructor;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;
import java.util.List;
import java.util.Optional;

@RestController
@RequestMapping("/api/students")
@RequiredArgsConstructor
@CrossOrigin(origins = "*")
public class StudentController {
    
    private final StudentService studentService;
    
    /**
     * Get all students
     */
    @GetMapping
    public ResponseEntity<List<Student>> getAllStudents() {
        List<Student> students = studentService.getAllStudents();
        return ResponseEntity.ok(students);
    }
    
    /**
     * Get student by ID
     */
    @GetMapping("/{id}")
    public ResponseEntity<?> getStudentById(@PathVariable Long id) {
        Optional<Student> student = studentService.getStudentById(id);
        if (student.isPresent()) {
            return ResponseEntity.ok(student.get());
        }
        return ResponseEntity.status(HttpStatus.NOT_FOUND)
                .body("Student not found with id: " + id);
    }
    
    /**
     * Get student by code
     */
    @GetMapping("/code/{studentCode}")
    public ResponseEntity<?> getStudentByCode(@PathVariable String studentCode) {
        Optional<Student> student = studentService.getStudentByCode(studentCode);
        if (student.isPresent()) {
            return ResponseEntity.ok(student.get());
        }
        return ResponseEntity.status(HttpStatus.NOT_FOUND)
                .body("Student not found with code: " + studentCode);
    }
    
    /**
     * Create new student
     */
    @PostMapping
    public ResponseEntity<?> createStudent(@RequestBody Student student) {
        try {
            Student newStudent = studentService.createStudent(student);
            return ResponseEntity.status(HttpStatus.CREATED).body(newStudent);
        } catch (IllegalArgumentException e) {
            return ResponseEntity.status(HttpStatus.BAD_REQUEST).body(e.getMessage());
        }
    }
    
    /**
     * Update student
     */
    @PutMapping("/{id}")
    public ResponseEntity<?> updateStudent(@PathVariable Long id, @RequestBody Student studentDetails) {
        try {
            Student updatedStudent = studentService.updateStudent(id, studentDetails);
            return ResponseEntity.ok(updatedStudent);
        } catch (IllegalArgumentException e) {
            return ResponseEntity.status(HttpStatus.NOT_FOUND).body(e.getMessage());
        }
    }
    
    /**
     * Delete student
     */
    @DeleteMapping("/{id}")
    public ResponseEntity<?> deleteStudent(@PathVariable Long id) {
        try {
            studentService.deleteStudent(id);
            return ResponseEntity.ok("Student deleted successfully");
        } catch (Exception e) {
            return ResponseEntity.status(HttpStatus.NOT_FOUND).body("Student not found with id: " + id);
        }
    }
    
    /**
     * Search students by name
     */
    @GetMapping("/search/name")
    public ResponseEntity<List<Student>> searchByName(@RequestParam String name) {
        List<Student> students = studentService.searchByName(name);
        return ResponseEntity.ok(students);
    }
    
    /**
     * Get students by major
     */
    @GetMapping("/search/major")
    public ResponseEntity<List<Student>> getStudentsByMajor(@RequestParam String major) {
        List<Student> students = studentService.getStudentsByMajor(major);
        return ResponseEntity.ok(students);
    }
    
    /**
     * Get active students
     */
    @GetMapping("/search/active")
    public ResponseEntity<List<Student>> getActiveStudents() {
        List<Student> students = studentService.getActiveStudents();
        return ResponseEntity.ok(students);
    }
}
