
# remove any previous student-submission
rm -rf student-submission >file.txt 2>&1
rm ListExamples.java >file.txt 2>&1
rm *.class  >file.txt 2>&1
rm file.txt >file.txt 2>&1
# clone the repository passed in as a CLI into student-submission
git clone $1 student-submission >file.txt 2>&1
echo 'Finished cloning'

# cd into the directory
cd student-submission >file.txt 2>&1
findfile=`find -name ListExamples.java`
if [[ -f $findfile ]]
then 
    cd ..
    echo "file found yay"
    cp student-submission/ListExamples.java . >file.txt 2>&1
    javac -cp ".;/lib/hamcrest-core-1.3.jar;lib/junit-4.13.2.jar" *.java >file.txt 2>&1
    if [[ $? == 0 ]]
    then
        echo 'Your code compiled. Congrats.'
        java -cp ".;lib/junit-4.13.2.jar;lib/hamcrest-core-1.3.jar" org.junit.runner.JUnitCore TestListExamples >file.txt 2>&1
        if [[ $? == 0 ]]
        then
            echo 'WORKED BABY CONGRATS U SUCCEED I SUCCEED'
        else 
            echo 'junit test fail haha loser'
        fi
    else    
        echo 'Error. Pls check ur own code before submitting :)'
    fi
else    
    echo 'File Does not EXIST bc'    
fi

    # method1=*"static List<String> filter(List<String> s, StringChecker sc)"*
    # method2=*"static List<String> merge(List<String> list1, List<String> list2)"*
    # containsmethod1=`grep "$method1" ListExamples.java`
    # containsmethod2=`grep "$method2" ListExamples.java`
    # if [[ $containsmethod1 != *$method1* ]] 
    # then
    #     echo "Method filter does not exist"
    #     exit 1
    # fi 
    # if [[ containsmethod2 != *$method2* ]]
    # then    
    #     echo "Method merge does not exist"
    #     exit 1
    # fi
    # echo "they both exist wow"