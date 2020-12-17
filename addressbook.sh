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
		echo "Delete Contact"
		echo "Enter surname or email address (case sensitive)."
		echo "Press 'Q' or 'q' to quit when you are done"
		read deleteContact
		if [ "$deleteContact" == 'q' ]
			then
			break
		fi
		echo
		echo "Contact Details for \"$deleteContact\":"
		grep -n "$deleteContact" addressbook.csv
		RETURNSTATUS=`echo $?`
		if [ $RETURNSTATUS -eq 1 ]
			then
			echo "No records found for \"$deleteContact\""
		else
			echo
			echo "Enter the line number (the first number of the entry) of the record you want to remove."
			read lineNum
			for line in `grep -n "$deleteContact" addressbook.csv`
			do
				number=`echo "$line" | cut -c1`
				if [ $number -eq $lineNum ]
					then
					lineRemove="${lineNum}d"
					sed -i -e "$lineRemove" addressbook.csv
					echo "Contact deleted successfully."
				fi
			done
		fi
		echo
	done
}

searchContact()
{
	echo
	while true
	do
		echo "Search Contact"
		echo "Enter surname or email address (case sensitive)."
		echo "Press 'Q' or 'q' to quit when you are done"
		read searchContact
		if [ "$searchContact" == 'Q' ] || [ "$searchContact" == 'q' ]
			then
			break
		fi
		echo
		echo "Contact Details \"$searchContact\":"
		grep "$searchContact" addressbook.csv
		RETURNSTATUS=`echo $?`
		if [ $RETURNSTATUS -eq 1 ]
			then
			echo "No contact with details:  \"$searchContact\" found."
		fi
		echo
	done
}


echo
lastCharOfFile=`tail -c 1 addressbook.csv` 
if [ -n "$lastCharOfFile" ]
	then
	echo >> addressbook.csv
fi
echo "Agnes Address Book"
echo "Please enter one of the following letters:"
echo "1) Create Contact"
echo "2) View 1 or more records"
echo "3) Edit Contact"
echo "4) Delete Contact"
echo "5) Search Contact"
echo
read selection

case $selection in
	1) createContact;;
	2) viewContact;;
	3) editContact;;
	4) deleteContact;;
	5) searchContact;;
esac

echo
cat <<EOF   
:)!
EOF
echo


