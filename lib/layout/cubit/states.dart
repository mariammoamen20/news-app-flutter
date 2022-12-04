abstract class NewsStates {}

class AppInitialState extends NewsStates {}

class AppBottomNavigationBarStat extends NewsStates {}

class AppNewsGetBusinessLoadingState extends NewsStates {}

class AppNewsGetBusinessSuccessState extends NewsStates {}

class AppNewsGetBusinessErrorState extends NewsStates {
  final String message;

  AppNewsGetBusinessErrorState(this.message);
}
class AppNewsGetSportsLoadingState extends NewsStates {}

class AppNewsGetSportsSuccessState extends NewsStates {}

class AppNewsGetSportsErrorState extends NewsStates {
  final String message;

  AppNewsGetSportsErrorState(this.message);
}
class AppNewsGetScienceLoadingState extends NewsStates {}

class AppNewsGetScienceSuccessState extends NewsStates {}

class AppNewsGetScienceErrorState extends NewsStates {
  final String message;

  AppNewsGetScienceErrorState(this.message);
}
