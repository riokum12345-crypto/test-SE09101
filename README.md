# 📚 Hệ Thống Quản Lý Sinh Viên (Student Management System)

Một ứng dụng Java Spring Boot hoàn chỉnh để quản lý thông tin sinh viên với REST API.

## ✨ Tính Năng

- ✅ CRUD Operations (Tạo, Đọc, Cập nhật, Xóa)
- ✅ Tìm kiếm sinh viên theo tên, mã sinh viên, chuyên ngành
- ✅ Quản lý trạng thái sinh viên
- ✅ REST API với Spring Boot
- ✅ Database MySQL với JPA/Hibernate
- ✅ Logging và Error Handling

## 🛠️ Công Nghệ Sử Dụng

- **Java 17**
- **Spring Boot 3.1.5**
- **Spring Data JPA**
- **MySQL 8**
- **Maven**
- **Lombok**

## 📁 Cấu Trúc Dự Án

```
src/
├── main/
│   ├── java/com/studentmanagement/
│   │   ├── entity/          # Các lớp entity (Student)
│   │   ├── repository/      # Data access layer
│   │   ├── service/         # Business logic
│   │   └── controller/      # REST controllers
│   └── resources/
│       └── application.properties  # Cấu hình ứng dụng
└── test/                    # Unit tests
```

## 🚀 Cách Cài Đặt

### 1. Yêu Cầu
- Java 17+
- Maven 3.6+
- MySQL 8.0+

### 2. Clone/Download dự án
```bash
cd d:\code java\test-SE09101
```

### 3. Tạo Database
```sql
CREATE DATABASE student_management CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
```

### 4. Cấu hình Database
Chỉnh sửa file `src/main/resources/application.properties`:
```properties
spring.datasource.url=jdbc:mysql://localhost:3306/student_management
spring.datasource.username=root
spring.datasource.password=your_password
```

### 5. Build dự án
```bash
mvn clean install
```

### 6. Chạy ứng dụng
```bash
mvn spring-boot:run
```

Ứng dụng sẽ chạy tại: `http://localhost:8080`

## 📡 API Endpoints

### Sinh Viên

| Method | Endpoint | Mô Tả |
|--------|----------|-------|
| GET | `/api/students` | Lấy tất cả sinh viên |
| GET | `/api/students/{id}` | Lấy sinh viên theo ID |
| GET | `/api/students/code/{studentCode}` | Lấy sinh viên theo mã code |
| POST | `/api/students` | Tạo sinh viên mới |
| PUT | `/api/students/{id}` | Cập nhật sinh viên |
| DELETE | `/api/students/{id}` | Xóa sinh viên |
| GET | `/api/students/search/name?name=...` | Tìm kiếm theo tên |
| GET | `/api/students/search/major?major=...` | Lấy sinh viên theo chuyên ngành |
| GET | `/api/students/search/active` | Lấy sinh viên đang hoạt động |

### Ví Dụ API Calls

#### 1. Tạo sinh viên mới
```bash
POST http://localhost:8080/api/students
Content-Type: application/json

{
  "fullName": "Nguyễn Văn A",
  "studentCode": "SV001",
  "dateOfBirth": "2004-01-15",
  "gender": "Nam",
  "email": "nguyenvana@example.com",
  "phoneNumber": "0123456789",
  "address": "Hà Nội",
  "major": "Kỹ Thuật Phần Mềm",
  "status": "ACTIVE"
}
```

#### 2. Lấy tất cả sinh viên
```bash
GET http://localhost:8080/api/students
```

#### 3. Cập nhật sinh viên
```bash
PUT http://localhost:8080/api/students/1
Content-Type: application/json

{
  "fullName": "Nguyễn Văn B",
  "email": "nguyenvanb@example.com",
  "major": "Trí Tuệ Nhân Tạo"
}
```

#### 4. Xóa sinh viên
```bash
DELETE http://localhost:8080/api/students/1
```

#### 5. Tìm kiếm sinh viên
```bash
GET http://localhost:8080/api/students/search/name?name=Nguyễn
```

## 📝 Mô Hình Dữ Liệu

### Student Entity
```
- id (Long, PK, Auto-increment)
- fullName (String, NOT NULL)
- studentCode (String, UNIQUE, NOT NULL)
- dateOfBirth (LocalDate, NOT NULL)
- gender (String)
- email (String)
- phoneNumber (String)
- address (String)
- major (String)
- status (String, DEFAULT: ACTIVE)
- createdAt (LocalDate, NOT NULL)
- updatedAt (LocalDate)
```

## 🧪 Testing

Chạy unit tests:
```bash
mvn test
```

## 📄 License

MIT License

## 🤝 Đóng Góp

Chào mừng các đóng góp! Vui lòng tạo issue hoặc pull request.

---

**Tác Giả**: Java Project Generator
**Phiên Bản**: 1.0.0
**Cập Nhật**: 2024
