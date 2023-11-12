# Students

Just a simple application to see how to build something in D.

## Requirements

* DMD64 D Compiler v2.105.3

## Build

```
dmd app.d
```

Run it with:

```
dmd -run app.d
```
Or use the build executable:
```
./app
```

Type `help` for the list of commands.
When you type `end` or `quit` it will show the averages per course per student.

# Evaluation

The good:

  * You can use classes and proper OO.
  * Fast compiler.
  * Immediatly run using the compiler.
  * Loads of documentation.

The bad:

  * Nothing yet.
  
The ugly:

  * Documentation is not really clear, some things where really difficult to find. The fact that splitter() returns a special type and not an array was unclear to me.
  * Also documentation: I could not understand how to split up the application into multi files and 'import' them into the app.d so I made it into one file.
