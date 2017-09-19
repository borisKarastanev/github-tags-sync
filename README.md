# Manual Installation and Development

Download the GIT repository in you favorite projects directory

```bash
$ git clone git@github.com:borisKarastanev/utils.git

```

# Content

## deploy-templates
Automate npm deployment with github tags for listed Nativescript Sidekick Templates 

### Enter the utils/deploy directory and copy the script to your fusion-templates directory

 ```bash
 $ cp ./deploy-templates.sh PATH_TO_YOUR/fusion-templates/
 
 ```
 
 ### Running the script 
 
 Make the file executable 


 ```bash
 $ chmod u+x ./deploy-templates.sh
 
 ```
 
 ### Run the script with a valid simver as an argument e.g [ 3.1.1 | major | minor | patch | ]

```bash
 $ ./githubTags.sh 3.1.4
 
 ```
