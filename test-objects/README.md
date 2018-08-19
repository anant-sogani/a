# Generate random JSON objects

## Introduction
You are given a JSON file that contains the definition of a class.
You need to print a random object of that class in JSON.

## Example 1

### Input
    {
       "Name" : {
          "firstName" : "string",
          "lastName"  : "string"
       }
    }

### Output
    {
       "firstName" : "FUHFM",
       "lastName"  : "IXMRG"
    }

## Example 2

### Input
    {
       "Employee" : {
          "age"    : "integer",
          "id"     : "integer",
          "salary" : "integer"
       }
    }

### Output
    {
       "age"    : 287,
       "id"     : 361,
       "salary" : 467
    }

## Example 3

### Input
    {
       "Person" : {
          "age"       : "integer",
          "firstName" : "string",
          "lastName"  : "string",
          "salary"    : "integer"
       }
    }

### Output
    {
       "age"       : 645,
       "firstName" : "OVSJV",
       "lastName"  : "SOVYV",
       "salary"    : 212
    }

## General Format
As you may have guessed from the above examples, the format of the
input JSON file is as follows:

    {
       "<className>" : {
          "<attribute-1>" : "<type-1>",
          "<attribute-2>" : "<type-2>",
          ...
          "<attribute-N>" : "<type-N>",
       }
    }

where a `<type>` is either **string** or **integer**.

The format of the output JSON will be:

    {
       "<attribute-1>" : "<random value of type-1>"
       "<attribute-2>" : "<random value of type-2>"
       ...
       "<attribute-N>" : "<random value of type-N>"
    }

**Sanity**: Note that there are *no* restrictions on the value that can
be assigned to an attribute, *as long as it is of the correct type*.
You need not worry about them being insane, like a value of `645` for an
attribute named `age`.

## Assignment
You need to write a program in Python that does the above.

## Tips
- Use a module that can read a JSON file.
- Use a module that can print a Python dictionary as JSON.
