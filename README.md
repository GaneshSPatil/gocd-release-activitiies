# gocd-release-activitiies
Scripts to perform GoCD post release activities

### updateDocsVersion.sh
Update various doc sites's /current and create a release branch:
 * docs.go.cd
 * developer.go.cd
 * api.go.cd
 * plugin-api.go.cd

Usage:
```
sh updateDocsVersion.sh CURRENT_VERSION VERSION_TO_RELEASE NEXT_VERSION
```

Example
```
sh updateDocsVersion.sh 17.2.0 17.3.0 17.4.0
```

### createRelease.sh
* Tags version in repository
* Creates a new github release

Usage:
```
node createRelease.js VERSION_TO_RELEASE GITHUB_ACCESS_TOKEN
```

Example
```
node createRelease.js 17.2.0 1ad2f4656a53a27b32d23a278a
```


### updateBuildGradle.sh
* Updates build.gradle file to next revision

Usage:
```
sh updateBuildGradle.sh CURRENT_VERSION NEXT_VERSION
```

Example
```
sh updateBuildGradle.sh 17.2.0 17.3.0
```

### updateGoPluginsPOMXml.sh
* updates go-plugins pom.xml - https://github.com/gocd/go-plugins/blob/master/pom.xml

Usage:
```
sh updateGoPluginsPOMXml.sh RELEASED_VERSION NEXT_VERSION
```

Example
```
sh updateBuildGradle.sh 17.3.0 17.4.0
```