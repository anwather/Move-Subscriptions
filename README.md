# Move Subscriptions

Bulk move subscriptions between management groups.

## Usage

Create a CSV file similar to ```test.csv``` in this repo. Supply subscription ID's and Management Group ID's as desired.

Run the script as below - it will show changes which are going to be made but not take effect.

```
.\Move-Subscriptions.ps1 -FileName .\test.csv
```

When you have validated the changes add the ```-Process``` switch to move the subscriptions.

```
.\Move-Subscriptions.ps1 -FileName .\test.csv -Process
```

Disclaimer:

The sample scripts are not supported under any Microsoft standard support program or service. The sample scripts are provided AS IS without warranty of any kind. Microsoft further disclaims all implied warranties including, without limitation, any implied warranties of merchantability or of fitness for a particular purpose. The entire risk arising out of the use or performance of the sample scripts and documentation remains with you. In no event shall Microsoft, its authors, or anyone else involved in the creation, production, or delivery of the scripts be liable for any damages whatsoever (including, without limitation, damages for loss of business profits, business interruption, loss of business information, or other pecuniary loss) arising out of the use of or inability to use the sample scripts or documentation, even if Microsoft has been advised of the possibility of such damages.
