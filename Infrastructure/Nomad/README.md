# Nomad Workload Orchestator

https://www.nomadproject.io/

# Simple Test Execution 

Download and setup nomad and run local server. Assuming you have scoop.sh installed on local windows system. 

```sh 
# You can use any other installer to install nomad. 
# I assumed you are using windows 10 or above. 
# Refer to scoop.sh for installation for scoop command. 

scoop install nomad
nomad agent -dev
```

Deploy the test batch job that will periodicly exceute ping commands. 

```sh
nomad job run ping-job/test.nomad
```

Monitor the job from Nomad UI

```sh
nomad ui
```

# Cron scheduled jobs

Please refer to following web site for cron settings. 

- https://crontab.guru/

Following means "At every 5th minute."

```
*/5 * * * *
```