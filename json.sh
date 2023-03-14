#!/bin/bash
echo "ENTER YOUR EMPLOYEE ID"
read id
echo "ENTER YOUR DESIGNATION"
read d
echo "ENTER YOUR NAME"
read name
echo "ENTER FILE NAME TO BE SAVED"
read file_name
echo "ENTER THE FILE TYPE"
read filetype (.json || .txt)
json=$(cat <<EOF
{
"status": "success",
"message": "Employee list",
"start": 0,
"total_results": 1,
"data": [{"empId": "$id","name":"$name","designation":"$d"}]
}
EOF
)
echo $json
if $filetype .json || .txt
{
touch $file_name.$filetype
echo $json >> $file_name.json
}
else
"Invalild"
cat $file_name.json | python3 -m json.tool
