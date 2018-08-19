#!/usr/bin/perl
# -----------------------------------------------------------------
# Program to create a database in SQL.
#
# Sections
# 1. Tables
# 2. Generators
# 3. Printers
# 4. Main
# -----------------------------------------------------------------
#
use strict;
use warnings;

#
# -------------------------------------------------------------
# SECTION 1: Tables
# -------------------------------------------------------------
# This section defines the tables in the database .
#
# . User
# . Phone
# . Address
# . Organization
# -------------------------------------------------------------
#

# Database name.
my $dbName = q(TestDB);

#
# Tables in the database, with the following information per table:
# (a) Fields that constitute a table record.
# (b) Value generator functions.
# (c) Number of records in a table.
#
my $tables = {

    #
    # User table.
    #
    'User' => {

        'primaryKey' => 'userId',

        'fields' => {

            'userId' => {
                'type' => 'bigint(20)',
                'attr' => 'not null',
                'gen'  => \&genUserId
            },

            'firstName' => {
                'type' => 'varchar(75)',
                'attr' => 'default null',
                'gen'  => \&genFirstName
            },

            'lastName' => {
                'type' => 'varchar(75)',
                'attr' => 'default null',
                'gen'  => \&genLastName
            },

            'emailAddress' => {
                'type' => 'varchar(75)',
                'attr' => 'default null',
                'gen'  => \&genEmailAddress
            },
        },

        'noOfRecords' => \&genCountUser
    },

    #
    # Phone table.
    #
    'Phone' => {

        'primaryKey' => 'number',

        'fields' => {

            'number' => {
                'type' => 'varchar(75)',
                'attr' => 'not null',
                'gen'  => \&genPhoneNumber
            },

            'extension' => {
                'type' => 'varchar(75)',
                'attr' => 'default null',
                'gen'  => \&genExtension
            },

            'userId' => {
                'type' => 'bigint(20)',
                'attr' => 'default null',
                'gen'  => \&genUserId
            },
        },

        'noOfRecords' => \&genCountPhone
    },

    #
    # Address table.
    #
    'Address' => {

        'primaryKey' => 'userId',

        'fields' => {

            'userId' => {
                'type' => 'bigint(20)',
                'attr' => 'not null',
                'gen'  => \&genUserId
            },

            'city' => {
                'type' => 'varchar(75)',
                'attr' => 'default null',
                'gen'  => \&genCity
            },
        },

        'noOfRecords' => \&genCountAddress
    },

    #
    # Organization table.
    #
    'Organization' => {

        'primaryKey' => 'userId',

        'fields' => {

            'userId' => {
                'type' => 'bigint(20)',
                'attr' => 'not null',
                'gen'  => \&genUserId
            },

            'name' => {
                'type' => 'varchar(100)',
                'attr' => 'default null',
                'gen'  => \&genOrganizationName
            },

            'type' => {
                'type' => 'varchar(75)',
                'attr' => 'default null',
                'gen'  => \&genOrganizationType
            },
        },

        'noOfRecords' => \&genCountOrganization
    },
};


#
# -------------------------------------------------------------
# SECTION 2: Generators
# -------------------------------------------------------------
# This section defines routines that generate values:
# (a) For fields in a table
# (b) For number of records
#
# . quote
#
# . generateStringCommon
# . generateWord
# . generateInteger
#
# . genUserId
# . genFirstName
# . genLastName
# . genEmailAddress
# . genPhoneNumber
# . genExtension
# . genCity
# . genOrganizationName
# . genOrganizationType
#
# . genRecord
#
# . genCountUser
# . genCountPhone
# . genCountAddress
# . genCountOrganization
#
# . genCountOverride
# -------------------------------------------------------------
#

#
# Wraps a string in single quotes.
#
sub quote {
    my $str = shift;

    return qq('$str');
}

#
# Generates a string of a particular length from a given alphabet.
#
sub generateStringCommon {
    my ($alphabet, $strLen) = @_;

    my $numberOfLetters = @{ $alphabet };

    # Start with an empty string.
    my $str = q();

    for (1 .. $strLen) {
        #
        # Select a letter at random.
        #
        my $index  = int(rand($numberOfLetters));
        my $letter = $alphabet->[$index];

        # Append it to the string.
        $str .= $letter;
    }

    # Return the string.
    return $str;
}

#
# Generates a word of a particular length.
#
sub generateWord {
    my $strLen = shift || 10;

    my @alphabet = qw(a b c d e f g h i j
                      k l m n o p q r s t
                      u v w x y z);

    return generateStringCommon(\@alphabet, $strLen);
}

#
# Generates an integer with a particular number of digits.
#
sub generateInteger {
    my $strLen = shift || 10;

    my @alphabet = qw(1 2 3 4 5 6 7 8 9);

    return generateStringCommon(\@alphabet, $strLen);
}

#
# Generates user-IDs.
#
sub genUserId {
    my $contextId = shift;

    return 1_000_000 + $contextId;
}

#
# Generates first names.
#
sub genFirstName {
    return quote(ucfirst(generateWord(7)));
}

#
# Generates last names. Quite boring :)
#
sub genLastName {
    return ucfirst q('Testman');
}

#
# Generates email addresses.
#
sub genEmailAddress {
    return quote(generateWord(7) . q(@) . q(coldmail.com));
}

#
# Generates phone numbers.
#
sub genPhoneNumber {
    return generateInteger(9);
}

#
# Generates extension numbers.
#
sub genExtension {
    return generateInteger(3);
}

#
# Generates city names. Not really :)
#
sub genCity {
    my @cities = qw(London Jaipur Mumbai Sydney Moscow Berlin);
    my $cityN  = @cities;
    my $city   = $cities[ int(rand($cityN)) ];

    return quote($city);
}

#
# Generates organization names.
#
sub genOrganizationName {
    return quote(ucfirst(generateWord(7)) . q( Consulting Services));
}

#
# Generates organization types. Nah :)
#
sub genOrganizationType {
    return q('regular-org');
}

#
# Generates a table record given its schema, and the context of
# the calling routine.
#
sub genRecord {
    my ($schema, $contextId) = @_;

    my @values;

    #
    # Iterate over every constituent field, and generate a value for it.
    #
    for my $f (sort keys %{ $schema->{'fields'} }) {

        my $gen = $schema->{'fields'}->{$f}->{'gen'};
        my $val = $gen->($contextId);

        push @values, $val;
    }

    my $record = join q(, ), @values;

    return qq{($record)};
}

#
# Returns the number of records in the User table.
#
sub genCountUser {
    return genCountOverride() || 3;
}

#
# Returns the number of records in the Phone table.
#
sub genCountPhone {
    return genCountOverride() || 4;
}

#
# Returns the number of records in the Address table.
#
sub genCountAddress {
    return genCountOverride() || 5;
}

#
# Returns the number of records in the Organization table.
#
sub genCountOrganization {
    return genCountOverride() || 6;
}

#
# Overrides the value returned by other Count routines.
# 0 implies no override.
#
sub genCountOverride { return 0 }


#
# -------------------------------------------------------------
# SECTION 3: Printers
# -------------------------------------------------------------
# This section defines routines that print the database in SQL.
#
# . pn
# . pnewline
#
# . printRecordsTableOne
# . printRecordsTables
# . printTableOne
# . printTables
# . printDbName
# . printHeader
#
# . printDb
# -------------------------------------------------------------
#

#
# Prints a line.
#
sub pn {
    my $line   = shift;
    my $indent = shift || q();

    print $indent . $line . qq(\n);
}

#
# Prints a newline.
#
sub pnewline { pn(q()) }

#
# Prints the records in a particular database table.
#
sub printRecordsTableOne {
    my ($name, $schema) = @_;

    pnewline;

    pn qq(-- ================================================);
    pn qq(-- Inserting records into table >>$name<<);
    pn qq(-- ================================================);
    pn qq(LOCK TABLES `$name` WRITE;);

    pnewline;

    pn qq(INSERT INTO `$name` VALUES);

    my $indent = q( ) x 4;

    #
    # Generate and print the requisite number of records.
    #
    my $count = $schema->{'noOfRecords'}->();

    for my $i (1 .. $count) {
        my $record = genRecord($schema, $i);

        pn qq($record,), $indent if $i <  $count;
        pn qq($record),  $indent if $i == $count;
    }

    pn qq(;);

    pnewline;

    pn qq(UNLOCK TABLES;);
}

#
# Prints the records in all the database tables.
#
sub printRecordsTables {

    for my $name (sort keys %{ $tables }) {
        my $schema = $tables->{$name};

        printRecordsTableOne($name, $schema);
    }
}

#
# Prints the definition of a particular database table.
#
sub printTableOne {
    my ($name, $schema) = @_;

    pnewline;

    pn qq(-- ================================================);
    pn qq(-- Definition of table >>$name<<);
    pn qq(-- ================================================);
    pn qq(DROP TABLE IF EXISTS `$name`;);

    pnewline;

    pn qq{CREATE TABLE `$name` (};

    my $indent = q( ) x 4;

    #
    # Iterate over and print the definition of all the fields
    # in a table.
    #
    for my $f (sort keys %{ $schema->{'fields'} }) {

        my $type = $schema->{'fields'}->{$f}->{'type'};
        my $attr = $schema->{'fields'}->{$f}->{'attr'};

        my $decl = q();
        $decl   .= sprintf("%-15s", qq(`$f`));
        $decl   .= sprintf("%-16s", qq($type));
        $decl   .= uc $attr;
        $decl   .= q(,);

        pn $decl, $indent;
    }

    pnewline;

    my $key = $schema->{'primaryKey'};

    pn qq{PRIMARY KEY (`$key`)}, $indent;

    pn qq{);};

    #
    # Sanity check.
    #
    die "Missing Primary Key `$key`"
        unless defined $schema->{'fields'}->{$key};
}

#
# Prints the definition of all the database tables.
#
sub printTables {

    for my $name (sort keys %{ $tables }) {
        my $schema = $tables->{$name};

        printTableOne($name, $schema);
    }
}

#
# Prints the database name.
#
sub printDbName {

    pnewline;

    pn qq(-- ==================);
    pn qq(-- Build our database);
    pn qq(-- ==================);
    pn qq(DROP   DATABASE IF EXISTS `$dbName`;);
    pn qq(CREATE DATABASE           `$dbName`;);
    pn qq(USE                       `$dbName`;);
}

#
# Prints the header comment.
#
sub printHeader {

    chomp (my $date = `date`);

    pn qq(--);
    pn qq(-- AUTO-GENERATED on $date);
    pn qq(--);
}

#
# Prints the database in SQL.
#
sub printDb {
    printHeader();
    printDbName();
    printTables();
    printRecordsTables();
}


#
# -------------------------------------------------------------
# SECTION 4: Main
# -------------------------------------------------------------
# This section defines the main logic of the program.
# -------------------------------------------------------------
#

#
# Print the database!
#
printDb();


__END__

#
# The SQL query for joining all the tables.
#
(select user.userId       "User-ID",
        user.firstName    "First Name",
        user.lastName     "Last Name",
        user.emailAddress "Email",
        phone.number      "Phone Number",
        phone.extension   "Extension",
        address.city      "City",
        org.name          "Company",
        org.type          "Org Type"

 from User         user,
      Phone        phone,
      Address      address,
      Organization org

where phone.userId = user.userId    and
      phone.userId = address.userId and
      phone.userId = org.userId

order by user.userId
);
