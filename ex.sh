# junit classpath
CPATH='.:lib/hamcrest-core-1.3.jar:lib/junit-4.13.2.jar'

# remove any previous student-submission
rm -rf student-submission
# clone the repository passed in as a CLI into student-submission
git clone $1 student-submission
echo 'Finished cloning'

# cd into the directory
cd student-submission
findfile=`find -name ListExamples.java`
if [[ -f $findfile ]]
then 
    javac -cp ".;../lib/hamcrest-core-1.3.jar;lib/junit-4.13.2.jar" *.java
    java -cp ".;../lib/junit-4.13.2.jar;lib/hamcrest-core-1.3.jar" org.junit.runner.JUnitCore ArrayTests

    echo 'ending'
fi
