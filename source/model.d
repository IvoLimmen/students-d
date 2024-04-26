module model;

import std.stdio;

class Course {

    string name;
    float[] grades;

    this(string name) {
        this.name = name;
    }

    void addGrade(float grade) {
        this.grades.length += 1;
        this.grades[this.grades.length - 1] = grade;
    }

    void total() {
        float total = 0;
        for (int i = 0; i < this.grades.length; i++) {
            total += this.grades[i];
        }
        float avg = total / this.grades.length;
        writefln("%s - %s exams - %.2f avg", this.name, this.grades.length, avg);
    }
}

class Student {

    string name;

    Course[] courses;

    this(string name) {
        this.name = name;
    }

    void addGrade(string course, float grade) {
        Course c = null;
        for (int i = 0; i < this.courses.length; i++) {
            if (this.courses[i].name == course) {
                c = this.courses[i];
            }
        }

        if (c is null) {
            c = new Course(course);
            this.courses.length += 1;
            this.courses[this.courses.length - 1] = c;
        }

        c.addGrade(grade);
    }

    void totals() {
        writefln("Grades for %s", this.name);
        for (int i = 0; i < this.courses.length; i++) {
            this.courses[i].total();
        }
    }

}
