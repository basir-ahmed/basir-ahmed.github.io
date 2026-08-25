# ============================================================================
# Claude Code + Amazon Bedrock Setup Script for Windows PowerShell
# ============================================================================
# This script checks prerequisites, logs in to AWS via 'aws login',
# sets Bedrock environment variables, and launches Claude Code.
# Requires AWS CLI v2.32.0+ (for 'aws login' support)
# ============================================================================

Write-Host "================================" -ForegroundColor Cyan
Write-Host "Claude Code + Bedrock Setup" -ForegroundColor Cyan
Write-Host "================================" -ForegroundColor Cyan
Write-Host ""

# ============================================================================
# Step 1: Check AWS CLI Installation
# ============================================================================
Write-Host "[1/5] Checking AWS CLI installation..." -ForegroundColor Yellow

$awsCliCheck = aws --version 2>$null
if ($LASTEXITCODE -ne 0) {
    Write-Host "AWS CLI not found!" -ForegroundColor Red
    Write-Host "Please install AWS CLI v2.32.0+ from: https://aws.amazon.com/cli/" -ForegroundColor Red
    exit 1
}
Write-Host "AWS CLI found: $awsCliCheck" -ForegroundColor Green
Write-Host ""

# ============================================================================
# Step 2: Check Claude Code Installation
# ============================================================================
Write-Host "[2/5] Checking Claude Code installation..." -ForegroundColor Yellow

$claudeCheck = claude --version 2>$null
if ($LASTEXITCODE -ne 0) {
    Write-Host "Claude Code not found!" -ForegroundColor Red
    Write-Host "Please install Claude Code first" -ForegroundColor Red
    exit 1
}
Write-Host "Claude Code found: $claudeCheck" -ForegroundColor Green
Write-Host ""

# ============================================================================
# Step 3: Login to AWS (skip if session already exists for 'claude' profile)
# ============================================================================
Write-Host "[3/5] Checking AWS session..." -ForegroundColor Yellow
Write-Host ""

$profileName = "claude"
$region = "ap-south-1"

$existingIdentity = aws sts get-caller-identity --profile $profileName 2>$null
if ($LASTEXITCODE -eq 0) {
    Write-Host "Existing AWS session found for profile '$profileName'. Skipping login." -ForegroundColor Green
} else {
    Write-Host "No valid session found for profile '$profileName'. Opening browser to sign in via 'aws login'..." -ForegroundColor Cyan
    aws login --profile $profileName --region $region

    if ($LASTEXITCODE -ne 0) {
        Write-Host "AWS login failed. Please try again." -ForegroundColor Red
        exit 1
    }
    Write-Host "AWS login successful. Profile set to: $profileName" -ForegroundColor Green
}

$env:AWS_PROFILE = $profileName
Write-Host ""

# ============================================================================
# Step 4: Set Bedrock Environment Variables
# ============================================================================
Write-Host "[4/5] Setting Bedrock Environment Variables..." -ForegroundColor Yellow

$env:CLAUDE_CODE_USE_BEDROCK = 1
$env:AWS_REGION = $region
$env:ANTHROPIC_MODEL = "global.anthropic.claude-sonnet-4-6"
$env:ANTHROPIC_DEFAULT_MODEL = "global.anthropic.claude-sonnet-4-6"
$env:ANTHROPIC_DEFAULT_SONNET_MODEL = "global.anthropic.claude-sonnet-5"
$env:ANTHROPIC_DEFAULT_HAIKU_MODEL = "global.anthropic.claude-haiku-4-5-20251001-v1:0"
$env:ANTHROPIC_DEFAULT_OPUS_MODEL = " global.anthropic.claude-opus-4-6-v1 "
$env:ANTHROPIC_DEFAULT_FABLE_MODEL = "global.anthropic.claude-fable-5"


Write-Host "Bedrock environment variables set:" -ForegroundColor Green
Write-Host "   CLAUDE_CODE_USE_BEDROCK = 1" -ForegroundColor Gray
Write-Host "   AWS_PROFILE = $profileName" -ForegroundColor Gray
Write-Host "   AWS_REGION = $region" -ForegroundColor Gray
Write-Host "   ANTHROPIC_MODEL = global.anthropic.claude-sonnet-5" -ForegroundColor Gray
Write-Host "   ANTHROPIC_DEFAULT_MODE = global.anthropic.claude-haiku-4-5-20251001-v1:0" -ForegroundColor Gray
Write-Host "   ANTHROPIC_DEFAULT_HAIKU_MODEL = global.anthropic.claude-haiku-4-5-20251001-v1:0" -ForegroundColor Gray
Write-Host "   ANTHROPIC_DEFAULT_OPUS_MODEL = global.anthropic.claude-opus-5" -ForegroundColor Gray
Write-Host "   ANTHROPIC_DEFAULT_FABLE_MODEL = global.anthropic.claude-fable-5" -ForegroundColor Gray
Write-Host ""

# ============================================================================
# Step 5: Verify AWS Credentials
# ============================================================================
Write-Host "[5/5] Verifying AWS Credentials..." -ForegroundColor Yellow

$awsIdentity = aws sts get-caller-identity --profile $profileName 2>$null
if ($LASTEXITCODE -eq 0) {
    Write-Host "AWS credentials verified!" -ForegroundColor Green
    Write-Host $awsIdentity -ForegroundColor Gray
} else {
    Write-Host "Could not verify AWS credentials" -ForegroundColor Yellow
    Write-Host "Make sure your login succeeded correctly" -ForegroundColor Yellow
}
Write-Host ""

# ============================================================================
# Step 6: Launch Claude Code with Bedrock
# ============================================================================
Write-Host "================================" -ForegroundColor Cyan
Write-Host "Starting Claude Code with Bedrock..." -ForegroundColor Cyan
Write-Host "================================" -ForegroundColor Cyan
Write-Host ""
Write-Host "Tips:" -ForegroundColor Yellow
Write-Host "  - Type /setup-bedrock to configure Bedrock settings interactively" -ForegroundColor Gray
Write-Host "  - Type /cost to check token usage and confirm Bedrock is active" -ForegroundColor Gray
Write-Host "  - Type /help for more commands" -ForegroundColor Gray
Write-Host "  - Run 'aws logout --profile $profileName' later to end this session" -ForegroundColor Gray
Write-Host ""

# Launch Claude Code
claude
