**House Price Prediction**

This project aims to predict house prices using a machine learning regression model. The dataset used is the **Ames Housing Dataset**, which contains various features related to residential homes in Ames, Iowa. The goal is to build a predictive model that estimates the sale price of houses based on features such as square footage, number of bedrooms, location, and more.


**Problem Statement**

Predicting house prices is a common real-world problem in real estate and finance. Accurate predictions can help buyers, sellers, and real estate agents make informed decisions. In this project, we aim to build a machine learning model that predicts the sale price of houses based on various features such as:
- Square footage
- Number of bedrooms and bathrooms
- Location
- Age of the house
- Other structural and aesthetic features

The target variable is **SalePrice**, and the task is a **regression problem**.

**Approach**

The project follows a standard machine learning pipeline:

1. **Data Loading**: The dataset is loaded from the **Ames Housing Dataset**.
2. **Exploratory Data Analysis (EDA)**:
   - Visualize the distribution of house prices.
   - Analyze correlations between numeric features.
3. **Data Preprocessing**:
   - Handle missing values using imputation.
   - Scale numerical features using `StandardScaler`.
   - Encode categorical features using `OneHotEncoder`.
4. **Model Training**:
   - Train a **Random Forest Regressor** using a pipeline that includes preprocessing and the model.
5. **Evaluation**:
   - Evaluate the model using **Root Mean Squared Error (RMSE)** and **R² Score**.

## Dataset

The dataset used in this project is the **Ames Housing Dataset**, which contains 79 explanatory variables describing almost every aspect of residential homes in Ames, Iowa. The dataset is available on [Kaggle](https://www.kaggle.com/c/house-prices-advanced-regression-techniques/data).

Key Features:
- **Numerical Features**: Square footage, number of rooms, year built, etc.
- **Categorical Features**: Neighborhood, house style, exterior quality, etc.
- **Target Variable**: SalePrice (the price at which the house was sold).

---

## Results

The trained model achieves the following performance metrics on the test set:

- **RMSE (Root Mean Squared Error)**: 29,285.52  
  - This indicates that, on average, the predicted house prices deviate from the actual prices by approximately $29,285.
- **R² Score**: 0.888  
  - The R² score measures how well the model explains the variance in the target variable. A score of **0.888** means the model captures about **88.8% of the variance** in house prices.

These results demonstrate that the model performs reasonably well but leaves room for improvement through hyperparameter tuning and feature engineering.


## Dependencies

The project requires the following Python libraries:
- `pandas`
- `numpy`
- `scikit-learn`
- `matplotlib`
- `seaborn`



## License

This project is licensed under the **MIT License**. See the [LICENSE](LICENSE) file for details.

---

Feel free to contribute to this project or use it as a starting point for your own work. If you have any questions or suggestions, feel free to open an issue or contact me.

---

### Author
SAMOUA ALSAMOUA 
Website: https://samoua-alsamoua.github.io/saalsamoua/ 
Email: samoua.alsamoua@gmail.com 

---
