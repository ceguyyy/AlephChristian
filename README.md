
#iOS App Documentation

a robust iOS app that fetches and displays data from a complex JSON structure,
showcasing skills in data handling, UI design, and navigation.

1. Technologies Used
Languages: Swift
Frameworks: SwiftUI
Tools: Xcode, GitHub, Apiary

2. App Architecture
2.1 Design Pattern
        The app follows the MVVM (Model-View-ViewModel) architecture.

    2.2 Folder Structure
        AlephChristian/
        ├── Infrastructure/
        ├── ImageCache/
        ├── Model/
        ├── View/
        ├── ViewModel/
        ├── Resources/
        ├── Network/
        ├── Preview Content/
        └── Response/

Infrastructure: Contains ImageCache for caching images and Res for resources related to infrastructure.
Model: Where your data models live.
View: For UI components.
ViewModel: To handle the logic that connects your Views and Models.
Resources: Contains resources related to your project, with a subdirectory for Network and Response for handling network-related tasks and responses.
            
3. Features

Page 1: Home Page (Categories)
Purpose:
The Home Page displays a list of categories, allowing users to see available categories and navigate to the items within each category.

Features:
Category List: A list of categories is displayed on the home page.
Each category displays:
Category Name: The name of the category.
Item Count: The number of items in that category.
Navigation:
When a user taps on a category, the app navigates to the Category Items Page, displaying the items within that category.
UI Components:
Category Name: Text displaying the name of the category.
Item Count: Text showing the number of items in each category.
List View: A list view that displays all the categories in a scrollable view.
Navigation: Tapping a category navigates to the Category Items Page.

Page 2: Category Items Page
Purpose:
The Category Items Page displays a list of items for the selected category. Each item shows basic details such as title, description, and thumbnail image. Tapping on an item navigates to the detailed view of that item.

Features:
Item List: A list of items belonging to the selected category.
Each item displays:
Title: The title of the item.
Description: A short description of the item.
Thumbnail Image: A thumbnail representing the item.
Navigation:
When a user taps on an item, the app navigates to the Item Detail Page, displaying detailed information for that item.
UI Components:
Item Title: Text displaying the title of the item.
Item Description: Text showing a brief description of the item.
Thumbnail Image: A small image preview of the item.
List View: A scrollable list view showing all the items for the selected category.
Navigation: Tapping an item navigates to the Item Detail Page.

Page 3: Item Detail Page
Purpose:
The Item Detail Page provides detailed information about the selected item, including its full description, large image, author, published date, and tags.

Features:
Item Details: Displays comprehensive information about the item.
Title: The title of the item.
Full Description: A detailed description of the item.
Large Image: A larger image of the item.
Author: The author or creator of the item.
Published Date: The date when the item was published or created.
Tags: A list of tags related to the item.
Navigation:
No further navigation; the user can return to the Category Items Page or Home Page using a back button or navigation controls.
UI Components:
Item Title: Text displaying the full title of the item.
Full Description: Text or formatted content showing the complete description of the item.
Large Image: A large, high-resolution image of the item.
Author: Text displaying the author of the item.
Published Date: Text displaying the publication dae.
Tags: A list of tags, presented as labels.
        
4. User Interface
    4.1 Design Guidelines
        Human Interface Guidelines for iOS.

5. Error handling
    Enum Cases:
invalidURL: For when the URL is not valid.
noData: For when no data is received from the server.
decodingError(String): For when there's an issue decoding the response, with a specific message describing the error.
serverError(String): For server-side errors, with a message describing the issue.
unknown(Error): For any other unknown errors, wrapping the underlying error.

6. Deployment
    Github : https://github.com/ceguyyy/AlephChristian

7. API Reference:
   Prod: https://private-455714-christiangunawan.apiary-mock.com/prod
   Dev: https://private-455714-christiangunawan.apiary-mock.com/dev






