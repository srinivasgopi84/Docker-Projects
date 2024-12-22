# LOTR API

Sample ASP .NET Core Web API VS Code Setup

#### Tasks

* `up-dev`
    * Run this once prior to debugging to build and launch the debug/development Docker container
    * This allows for local building of the code, which is then mapped into the container and can be debugged easily using `F5`
* `up-prod`
    * Using a multi-stage Docker build, builds the code in an intermediate container and then runs the API in the release/production container
* `down-dev`
    * Stops the debug/development Docker container
* `down-prod`
    * Stops the release/production Docker container
