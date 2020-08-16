import 'package:news_app1/models/category_model.dart';

List<CategoryModels> getCategories(){

  List<CategoryModels> category = new List<CategoryModels>(); 
  CategoryModels categoryModels = new CategoryModels();

  //1
  categoryModels.categoryName="AR";
  categoryModels.imageUrl = "https://images.unsplash.com/photo-1550052558-11de18b04282?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1050&q=80";
  category.add(categoryModels);

  categoryModels = new CategoryModels();

  //2
  categoryModels.categoryName="VR";
  categoryModels.imageUrl = "https://images.unsplash.com/photo-1592478411213-6153e4ebc07d?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1000&q=80";
  category.add(categoryModels);

  categoryModels = new CategoryModels();

  //3
  categoryModels.categoryName = "GAME";
  categoryModels.imageUrl = "https://images.unsplash.com/photo-1486572788966-cfd3df1f5b42?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1052&q=80";
  category.add(categoryModels);

  categoryModels = new CategoryModels();


  return category; 



}