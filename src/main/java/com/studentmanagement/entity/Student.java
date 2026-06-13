package com.studentmanagement.entity;

import jakarta.persistence.*;
import lombok.*;
import java.time.LocalDate;

@Entity
@Table(name = "students")
@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class Student {
    
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;
    
    @Column(nullable = false, length = 100)
    private String fullName;
    
    @Column(unique = true, nullable = false, length = 20)
    private String studentCode;
    
    @Column(nullable = false)
    private LocalDate dateOfBirth;
    
    @Column(length = 10)
    private String gender;
    
    @Column(length = 100)
    private String email;
    
    @Column(length = 20)
    private String phoneNumber;
    
    @Column(length = 100)
    private String address;
    
    @Column(length = 50)
    private String major;
    
    @Column(nullable = false)
    private String status = "ACTIVE";
    
    @Column(name = "created_at", nullable = false, updatable = false)
    private LocalDate createdAt = LocalDate.now();
    
    @Column(name = "updated_at")
    private LocalDate updatedAt = LocalDate.now();
}
