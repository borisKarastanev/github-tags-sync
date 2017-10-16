# Manual Installation and Development

Download the GIT repository in you favorite projects directory

```bash
$ git clone git@github.com:NativeScript/nativescript-starter-kits-utils.git

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
 
 ### Run the script with valid arguments
  
 #### 1: Valid Sidekick templates directory
 #### 2: Valid simver as an argument e.g [ 3.1.1 | major | minor | patch | ]

```bash
 $ ./deploy-templates.sh ./your-templates-dir 3.1.4
 
 ```

## deploy-extension
Automate npm deployment with github tags for the Nativescript Starter Kits Extension

### Enter the utils/deploy directory and copy the script to your nativescript-starter-kits directory

 ```bash
 $ cp ./deploy-extension.sh PATH_TO_YOUR/nativescript-starter-kits/
 
 ```
 
 ### Running the script 
 
 Make the file executable 


 ```bash
 $ chmod u+x ./deploy-extension.sh
 
 ```
 
 ### Run the script with a valid simver as an argument e.g [ 3.1.1 | major | minor | patch | ]

```bash
 $ ./deploy-extension.sh 3.1.4
 
 ```
 
## get-templates
### Enter the utils/download directory and copy the script to your fusion-templates directory

 ```bash
 $ cp ./get-templates.sh PATH_TO_YOUR/fusion-templates/
 
 ```
 
 ### Running the script 
 
 Make the file executable 


 ```bash
 $ chmod u+x ./get-templates.sh
 
 ```
 
 ### Run the script 

```bash
 $ ./get-templates.sh
 
 ```
