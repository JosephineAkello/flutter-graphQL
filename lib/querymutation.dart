class QueryMutation {
  String loginUser = r''' 
    query FetchUser($email: String!, $password: String!){
  findFirstUser(where: {email : {equals: $email}, password: {equals: $password}}){
  id,
  name 
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


