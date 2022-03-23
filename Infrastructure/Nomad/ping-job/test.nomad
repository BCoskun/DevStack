job "ping-job" {

    datacenters = ["dc1"]
    
    type = "batch"
    
    periodic {
        cron      = "*/5 * * * *"
        time_zone = "America/New_York"
        prohibit_overlap = true
    }

    group "batch-activites" {
        task "test-localhost" {
            driver = "raw_exec"

            config {
                command = "C:/Windows/System32/ping" 
                args = ["localhost","-4"]
            }
        }

        task "test-google.com" {
            driver = "raw_exec"

            config {
                command = "C:/Windows/System32/ping" 
                args = ["www.google.com","-4"]
            }
        }

    }
}