# App Template Npm Dependency Update

 Install [npm-check-updates](npm-check-updates) npm package globally: `npm install -g npm-check-updates`.
 
Get in the template folder and run `ncu`. This will show you the new versions that came out. Check if the proposed changes look right. Watch out for new major version bumps -- check changes.  

Run `ncu -u`. This will update the package.json file.

Create an app from the newly updated template.

Run `npm install` in the app folder (not the template). This will let you see a better output.

Look for `X requires a peer of Y, but none was installed`. This means that we should hard code Y's version to the one required in the peer dependency. This should happen when a dependency we use requires an older version of another dependency, because it hasn't been tested/approved.  

Run and test.  
