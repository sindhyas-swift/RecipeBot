# RecipeBot
Recipe search application.

### Steps to Run the App 

In order to run the app provided via the GitHub link please follow the steps as below: 

Navigate to the GitHub link provided. 
Copy the repository URL. 
Open Xcode application and go to Integrate -> Clone and paste the URL. 
Now select a location to save the project. 
Select a simulator and Build/Run the app by clicking the run button in Xcode. 
### Focus Areas: What specific areas of the project did you prioritize? Why did you choose to focus on these areas? 

From a developer’s point of view, as this app has very minimum functionalities, I focused mainly on the User interface and Performance optimization. I have designed the UI by keeping in mind an app that is simple and visually appealing. Performance of the app was taken into consideration for a faster loading using swift concurrency (Async/Await). To reduce the network usage and to have an optimum storage utilization, Images were stored in cache. MVVM architecture is used to make the code clean, testable and maintainable. 

 
### Time Spent: Approximately how long did you spend working on this project? How did you allocate your time? 

Approximately I have spent 4.5 hours on the project in total. I have started with input study, during this stage, I have gathered all the required information and segregated the requirement specs. After that, I have worked on the planning, which involved creating a rough sketch of the UI (UI design), and which architecture to use. Then I moved to the execution phase ,where I started by creating the application’s UI and testing it with mock data. . After which I have integrated the API and finally did a unit testing to make sure the app is working as expected. As a final phase, I have completed the documentation. 
 
### Trade-offs and Decisions: Did you make any significant trade-offs in your approach? 

The application uses some of the images like icons and logos which are taken from internet. I feel, for better user experience, the application needs to have another screen that opens to the YouTube link and details of the recipe. Since the requirement was for a single screen application, that implementation was not done. 
 
### Weakest Part of the Project: What do you think is the weakest part of your project? 

I have tested the application only on few of the simulators like iPhone 16, iPhone 16 pro max and iPhone SE. Since multiple devices and OS versions hasn't been tested, the compatibility of the application’s UI is the weakest part. 

 
### External Code and Dependencies: Did you use any external code, libraries, or dependencies? 

As this is a small project, I didn't find any need to use any third-party libraries or dependencies. 
 
### Additional Information: Is there anything else we should know? Feel free to share any insights or constraints you encountered. 

A sorting has been added to alphabetically sort the data by name of recipes, in case data received from API is not sorted. Also, this sorting will be done while displaying search results as well. Refresh functionality has been added for the application using pull to refresh. Image caching has been implemented to prevent downloading of the images again. Application is made to support iOS 16 and above. 

Malformed data and empty data end points has been added to the project and has handled an empty state implementation to show the empty state to user and both cases were tested. 

Developer level overall app testing and Unit testing(XCTest) was done for the application, to test the count, sorting and filter functionalities. 
