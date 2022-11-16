# Create your grading script here

set -e

CPATH=.:../lib/hamcrest-core-1.3.jar:../lib/junit-4.13.2.jar

rm -rf student-submission
git clone $1 student-submission 2> err.txt
cp TestListExamples.java student-submission

cd student-submission
if [[ ! -f ListExamples.java ]]
    then 
        exit
fi

javac -cp $CPATH TestListExamples.java

if [[ $? -eq 0 ]]
    then
        echo "Compile worked"
    else
        echo "Compile didn't work"
fi   

java -cp $CPATH org.junit.runner.JUnitCore TestListExamples > testresult.txt
