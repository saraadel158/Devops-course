
#!/bin/bash

choice='m'
while [ $choice = 'm' ]
do
    echo 'press i to add new contact'
    echo 'press v to view all records'
    echo 'press s to search for record'
    echo 'press e to delete all contacts'
    echo 'press d to delete one contact'
    echo 'press q to exit'
    read -p 'please enter your choice : ' input
    echo $input
    if [ $input = 'i' ]
    then
        read -p 'please enter first name : ' fName
        read -p 'please enter last name : ' LName
        read -p 'please enter email : ' email
        read -p 'please enter phone number : ' phoneNumber
        echo $fName , $LName , $email , $phoneNumber >> DB.txt
        read -p 'if you want to return to the main manu press m , press q to quit : ' choice
    fi
    if [ $input = 'v' ] || [ $input = 'V' ]
    then
        cat DB.txt
        read -p 'if you want to return to the main manu press m , press q to quit : ' choice
        
    fi
    if [ $input = 's' ] || [ $input = 'S' ]
    then
        read -p 'please enter your search : ' wToFind
        grep $wToFind DB.txt
        read -p 'if you want to return to the main manu press m , press q to quit : ' choice
        
    fi
    if [ $input = 'e' ] || [ $input = 'E' ]
    then
        >DB.txt
        read -p 'if you want to return to the main manu press m , press q to quit : ' choice
        
    fi
    if [ $input = 'd' ] || [ $input = 'D' ]
    then
        read -p ' please enter what you want to delete : ' toBeDeleted
        grep -v $toBeDeleted DB.txt  > tmpfile && mv tmpfile DB.txt   
        read -p 'if you want to return to the main manu press m , press q to quit : ' choice
        
    fi
    if [ $input = 'q' ] || [ $input = 'q' ]
    then
        exit
    fi
done
