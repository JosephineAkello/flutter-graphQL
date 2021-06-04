class QueryMutation {
  String loginUser = r''' 
 mutation LoginUser($userData: UserCreateInput!){
  loginUser(data: $userData){
    id,
    userId,
    user
  }
}
    ''';

  String createUser = r'''
  mutation CreateUser($userData: UserCreateInput!){
  createUser(data: $userData){
    email,
    name,
    password,
  }
}
    ''';
  String getAllUsers = r'''
        query GetAllUsers{
          users{
            name,
            email,
            password,
            createdAt
          }
        }}
    ''';
}


