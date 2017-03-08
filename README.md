# gocd-release-activitiies
Scripts to do post release activities

### updateDocsVersion.sh
Update various doc sites's /current and create a release branch:
 * docs.go.cd
 * developer.go.cd
 * api.go.cd
 * plugin-api.go.cd

Usage:
```
sh updateDocsVersion.sh CURRENT_VERSION VERSION_TO_RELEASE NEXT_VERSION REMOTE_NAME
```

Example
```
sh updateDocsVersion.sh 17.2.0 17.3.0 17.4.0
```
