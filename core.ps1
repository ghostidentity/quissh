<#
.DESCRIPTION
    This script retrieves questions from a file.
#>


param (
    [Parameter(Mandatory=$true)]
    [string]$Function,

    [string]$Counter,
    [string]$QuestionID,
    [string]$Answer
)


function Submit-Score {
    Write-Output "Submitting..." | Out-Default

    # Get the username
    $Username = whoami

    # Extract SSH client IP address from the SSH_CLIENT environment variable
    $sshClient = $env:SSH_CLIENT
    $sshClientIP = ($sshClient -split " ")[0]

    # Create a custom object with the data
    $data = New-Object PSObject -Property @{
        USERNAME    = $Username
        COUNTER     = $Counter
        QUESTION_ID = $QuestionID
        ANSWER      = $Answer
        IP_ADDRESS  = $sshClientIP
    }

    # Export data to CSV
    $data | Export-Csv -Path 'exam.csv' -NoTypeInformation -Append

    Write-Output "Received."
}

function Get-Questions {
    Write-Output "Questions retrieved successfully:"
    $questions = Get-Content -Path 'questions.txt'
    Write-Output $questions
}

Invoke-Expression "$Function"
