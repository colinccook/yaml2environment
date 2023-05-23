# yaml2environment
Declaratively describe your development environment setup, and let yaml2environment do the rest


```yaml
chocolatey-dependencies:
 - name: VisualStudio2022
chocolatey-windows-depdendencies:
 - name: IIS
hosts:
 - name: localhost
   IP: 127.0.0.1
 - name: local
   IP: 127.0.0.1
git-repositories:
 - url: https://www.github.com/something
   directory: C:\Git\
   branch: develop
 - url: https://www.github.com/something
   directory: C:\Git\
   branch: develop
dotNetBuild:
 - Solution: C:\Git\something\something.sln
```
