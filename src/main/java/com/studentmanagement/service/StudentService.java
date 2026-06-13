package com.studentmanagement.service;

import com.studentmanagement.entity.Student;
import com.studentmanagement.repository.StudentRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import java.time.LocalDate;
import java.util.List;
import java.util.Optional;

@Service
@RequiredArgsConstructor
@Transactional
public class StudentService {
    
    private final StudentRepository studentRepository;
    
    /**
     * Get all students
     */
    public List<Student> getAllStudents() {
        return studentRepository.findAll();
    }
    
    /**
     * Get student by ID
     */
    public Optional<Student> getStudentById(Long id) {
        return studentRepository.findById(id);
    }
    
    /**
     * Get student by code
     */
    public Optional<Student> getStudentByCode(String studentCode) {
        return studentRepository.findByStudentCode(studentCode);
    }
    
    /**
     * Create new student
     */
    public Student createStudent(Student student) {
        if (studentRepository.findByStudentCode(student.getStudentCode()).isPresent()) {
            throw new IllegalArgumentException("Student code already exists: " + student.getStudentCode());
        }
        student.setCreatedAt(LocalDate.now());
        student.setUpdatedAt(LocalDate.now());
        return studentRepository.save(student);
    }
    
    /**
     * Update student
     */
    public Student updateStudent(Long id, Student studentDetails) {
        Student student = studentRepository.findById(id)
                .orElseThrow(() -> new IllegalArgumentException("Student not found with id: " + id));
        
        student.setFullName(studentDetails.getFullName());
        student.setDateOfBirth(studentDetails.getDateOfBirth());
        student.setGender(studentDetails.getGender());
        student.setEmail(studentDetails.getEmail());
        student.setPhoneNumber(studentDetails.getPhoneNumber());
        student.setAddress(studentDetails.getAddress());
        student.setMajor(studentDetails.getMajor());
        student.setStatus(studentDetails.getStatus());
        student.setUpdatedAt(LocalDate.now());
        
        return studentRepository.save(student);
    }
    
    /**
     * Delete student
     */
    public void deleteStudent(Long id) {
        studentRepository.deleteById(id);
    }
    
    /**
     * Search students by name
     */
    public List<Student> searchByName(String name) {
        return studentRepository.findByFullNameContainingIgnoreCase(name);
    }
    
    /**
     * Get students by major
     */
    public List<Student> getStudentsByMajor(String major) {
        return studentRepository.findByMajor(major);
    }
    
    /**
     * Get students by status
     */
    public List<Student> getStudentsByStatus(String status) {
        return studentRepository.findByStatus(status);
    }
    
    /**
     * Get active students
     */
    public List<Student> getActiveStudents() {
        return studentRepository.findByStatus("ACTIVE");
    }
}
