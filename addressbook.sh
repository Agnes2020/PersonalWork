#!/bin/bash

saveContact()
{
	echo
	while true
	do
		echo "Add a new contact to your address book". 
		echo "format: \"Surname,First Name,Email,Phone Number\" (separate with comma)."
		echo "Example: Snow,John,johnsnow@got.com,0501234567"
		echo "Press 'Q' or 'q' to quit."
		read newContact
		if [ "$newContact" == 'Q' ] || [ "$newContact" == 'q' ]
			then
			break
		fi
		echo
		echo $newContact >> addressbook.csv
		echo "New contact created successfully."
		echo
	done
}

viewContact()
{
	echo
	while true
	do
		echo "View Contact"
		echo "Enter surname. (case sensitive)."
		echo "Press 'Q' or 'q' to quit."
		read viewContact
		if [ "$viewContact" == 'Q' ] || ["$viewContact" == 'q' ]
			then
			break
		fi
		echo
		echo "Contact Details for \"$viewContact\":"
		grep ^"$viewContact" addressbook.csv   
		RETURNSTATUS=`echo $?`
		if [ $RETURNSTATUS -eq 1 ]
			then
			echo "No contact with surname:  \"$viewContact\" found."
		fi
		echo
	done
}

editContact()
{
	echo
	while true
	do
		echo "Edit Contact"
		echo "Enter last name or email address. (case sensitive)."
		echo "Press 'Q' or 'q' to quit when you are done"
		read editContact
		if [ "$editContact" == 'Q' ] || ["$editContact" == 'q' ]
			then
			break
		fi
		echo
		echo "Contact Details for \"$editContact\":"
		grep -n "$editContact" addressbook.csv
		RETURNSTATUS=`echo $?`
		if [ $RETURNSTATUS -eq 1 ]
			then
			echo "No contact with surname:  \"$viewContact\" found."
		else
			echo
			echo "Enter the line number (the first number of the entry) that you wamt to edit."
			read lineNum
			echo
			for line in `grep -n "$editContact" addressbook.csv`
			do
				number=`echo "$line" | cut -c1`
				if [ $number -eq $lineNum ]
					then
					echo "Update Contact Details:"
					echo "\"Surname,First name,Email,Phone number\"."
					read edit
					lineChange="${lineNum}s"
					sed -i -e "$lineChange/.*/$edit/" addressbook.csv
					echo
					echo \"$viewContact\" details edited successfully."
				fi
			done
		fi
		echo
	done		
}

deleteContact()
{
	echo 
	while true
	do
		echo "To remove a record, enter any search string, e.g. last name or email address (case sensitive)."
		echo "If you're done, enter 'q' to quit."
		read rInput
		if [ "$rInput" == 'q' ]
			then
			break
		fi
		echo
		echo "Listing records for \"$rInput\":"
		grep -n "$rInput" addressbook.csv
		RETURNSTATUS=`echo $?`
		if [ $RETURNSTATUS -eq 1 ]
			then
			echo "No records found for \"$rInput\""
		else
			echo
			echo "Enter the line number (the first number of the entry) of the record you want to remove."
			read lineNumber
			for line in `grep -n "$rInput" addressbook.csv`
			do
				number=`echo "$line" | cut -c1`
				if [ $number -eq $lineNumber ]
					then
					lineRemove="${lineNumber}d"
					sed -i -e "$lineRemove" addressbook.csv
					echo "The record was removed from the address book."
				fi
			done
		fi
		echo
	done
}

searchRecord()
{
	echo
	while true
	do
		echo "To search for a record, enter any search string, e.g. last name or email address (case sensitive)."
		echo "The format of a record is \"Last name,firstname,email address,phone number\"."
		echo "Example: Doe,John,johndoe@gmail.com,6501234567"
		echo "If you'd like to quit, enter 'q'."
		read sInput
		if [ "$sInput" == 'q' ]
			then
			break
		fi
		echo
		echo "Listing records for \"$sInput\":"
		grep "$sInput" addressbook.csv
		RETURNSTATUS=`echo $?`
		if [ $RETURNSTATUS -eq 1 ]
			then
			echo "No records found for \"$sInput\"."
		fi
		echo
	done
}


echo
lastCharOfFile=`tail -c 1 addressbook.csv` # checking to make sure the .csv file ends with newline character
if [ -n "$lastCharOfFile" ]
	then
	echo >> addressbook.csv
fi
echo "Hello, what would you like to do with your address book?"
echo "Please enter one of the following letters:"
echo "a) to add a record"
echo "d) to display 1 or more records"
echo "e) to edit a record"
echo "r) to remove a single record"
echo "s) to search for records"
echo
read input

case $input in
	a) addToRecord;;
	d) displayRecord;;
	e) editRecord;;
	r) removeRecord;;
	s) searchRecord;;
esac

echo
# HERE doc
cat <<EOF   
Any changes you made have been saved.
Have a nice day!
EOF
echo


