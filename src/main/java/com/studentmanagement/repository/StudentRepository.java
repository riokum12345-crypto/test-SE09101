package com.studentmanagement.repository;

import com.studentmanagement.entity.Student;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;
import java.util.Optional;
import java.util.List;

@Repository
public interface StudentRepository extends JpaRepository<Student, Long> {
    
    Optional<Student> findByStudentCode(String studentCode);
    
    List<Student> findByFullNameContainingIgnoreCase(String fullName);
    
    List<Student> findByMajor(String major);
    
    List<Student> findByStatus(String status);
    
    List<Student> findByEmailContaining(String email);
}
