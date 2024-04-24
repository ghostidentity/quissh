# Instruction

1. Enable OpenSSH server on Windows via Optional Features
2. On services msc, configure the agent and openssh server to run automatically
3. On C:\ProgramData\ssh\sshd_config, update the values:

 =>  PubkeyAuthentication yes
 =>  PasswordAuthentication no
 =>  and then create another match group : 

Match Group students
        AuthorizedKeysFile __PROGRAMDATA__/ssh/students_authorized_keys
        PubkeyAuthentication yes
        Banner F:\banner-student.txt
        ChrootDirectory F:\isolated\students
        AllowTcpForwarding no
        X11Forwarding no

 4. Restart the openssh server on services.msc
 5. On user's home directory, navigate to .ssh folder, add then student(s) public public key to students_authorized_keys
 6. Copy the program files: copy.ps1 and questions.txt and exam.csv
 7. Open run command and type: lusrmgr.msc , and then navigate to groups folder and then create another group name it Students.
   a) click on the student group, then add a member, you will need to select the account provided by Active Directory
 8. For the system to automatically route the SSH client to specific folder, with that you will need to create another folder ex. students and update the security
   a) Disable Inheritance
   b) Ensure to have this groups only:  SYSTEM = FULL ACCESS, Administrators  - full access, finance = readonly access (Full control and modify access should be disabled).
 9. Now login to active directory account that you added as part of student group,  then create an rsa key pair by running command: ssh-keygen -t rsa -b 4096. 
    You will need the public key inserted on students_authorized_keys
10. On examiner app, click on gear icon, then provide the required information.
