export interface User {
  id?: number;
  userName: string;
  email: string;
  password: string;
  admin?: boolean;
  ban?: boolean;
}
