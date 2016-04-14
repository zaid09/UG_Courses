#include<stdio.h>
    #include<stdlib.h>
    #include<unistd.h>
    #include<sys/types.h>
    #include<sys/wait.h>
    #include<sys/queue.h>

    int status_left, status_right;
    pid_t left_child;
    pid_t right_child;
    int i = 0,j = 0,k,l, a[20];
    void recursive_creation(int);
    void push(int);
    int pop();

    main(int argc, char **argv){
        if(argc != 2){
            printf("Insufficient arguments!!!");
            exit(-1);
        }
	int leaves = atoi(argv[1]);
        k = leaves;
        if(leaves < 1){
            printf("Please insert a positive number");
            exit(-1);
        }
	recursive_creation(leaves);
    }

	void recursive_creation(int leaves){

        if(leaves > 1){
            push(getpid());

            if((left_child = fork())==0){
                    if(leaves & 1)
                        recursive_creation((leaves/2)+1);
                    else
                        recursive_creation(leaves/2);
            }
            else if((right_child=fork())==0){

                recursive_creation(leaves/2);
            }
            else{
                waitpid(left_child,&status_left,0);
		 waitpid(right_child,&status_right,0);
            }

	}
	else{
            while(i != j){
                printf("%d  ",pop());
            }
            printf("%d\n",getpid());
        }
    }

    void push(int n){
        a[i] = n;
        i++;
    }
    int pop(){
	j++;
	 return a[j-1];
    }



		
