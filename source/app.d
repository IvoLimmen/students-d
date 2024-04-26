import std.stdio;
import std.string;
import std.algorithm;
import std.array;
import std.conv;

import model;

void help() {
  writefln("Grading system");
  writefln("add-student [name] - Add student");
  writefln("select-student [name] - Select a student");
  writefln("add-grade [course] [grade] - Add a grade for a course for the current selected student");
  writefln("end - Stop the program");
}

Student student = null;
Student[] students = [];

void main() {

    while (true) {
        writef("Input command:");
        string command = strip(readln());

        if (command is null) {
            writefln("Please enter a valid command.");
            help();
        }
        if (command == "help") {
            help();
        }
        if (command == "end" || command == "quit") {
            break;
        }
        if (command.startsWith("add-student")) {
            string name = command.splitter(" ").array()[1];
            student = new Student(name);
            students.length += 1;
            students[students.length - 1] = student;
        }
        if (command.startsWith("select-student")) {
            string name = command.splitter(" ").array()[1];
            student = null;
            for (int i = 0; i < students.length; i++) {
                if (students[i].name == name) {
                    student = students[i];
                }
            }

            if (student is null) {
                writefln("Student %d is not found", name);
            } else {
                writefln("Student %d is selected", name);
            }
        }
        if (command.startsWith("add-grade")) {
            string[] args = command.splitter(" ").array();
            string course = args[1];
            float grade = to!float(args[2]);

            if (student is null) {
                writefln("No student selected");
            } else {
                student.addGrade(course, grade);
            }
        }
    }

    foreach(Student s; students) {
        s.totals();
    }
}
