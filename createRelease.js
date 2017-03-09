var request = require("request");
var GitHub = require('github-base');

var version = process.argv[2];

if(!process.argv[3]){
  console.log("please provide a valid GITHUB_ACCESS_TOCKEN")
  return;
}
var github = new GitHub({
  token: process.argv[3]
});

request('https://download.gocd.io/releases.json', function (err, httpResponse, responseBody) {
  var installer = findVersion(JSON.parse(responseBody), version);
  createGithubRelease(installer);
});

var findVersion = function(allReleases, versionToRelease){
  var installer = allReleases.find(function(installerVersion){
    return (installerVersion.go_version === versionToRelease)
  });

  if(installer === undefined){
    throw new Error(versionToRelease, 'is not released on gocd.io');
  }

  return installer;
};

var createGithubRelease = function(installer){
  var goVersion = installer.go_version;
  var gitSHA = installer.git_sha;

  console.log("Creating github release for version", goVersion, "with commit", gitSHA);

  github.post('/repos/gocd/gocd/releases', {
    tag_name: 'v' + goVersion,
    target_commitish: gitSHA,
    name: 'GoCD ' + goVersion,
    body: 'Check release notes at https://www.gocd.io/releases/#' + goVersion
  }, function(err, res) {
    if(err){
      console.error('Something went wrong!!!');
      console.error(err);
    }else {
      console.log(res);
    }
  });
};
