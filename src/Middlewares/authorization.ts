import { NextFunction, Request, Response } from "express";
import { verify } from "jsonwebtoken";
import { SECRET } from "../global";
interface JwtPayload {
  id: string;
  name: string;
  email: string;
  role: string;
}

export const verifyToken = async (
  request: Request,
  response: Response,
  next: NextFunction
) => {
  const token = request.headers.authorization?.split(" ")[1];

  if (!token) {
    response.status(403).json({
      message: `Token invalid. There are no token available`,
    });
    return;
  }

  try {
    const secretKey = SECRET || "";
    const decoded = verify(token, secretKey);

    // Tambahkan field 'user' langsung ke request (lebih baik daripada ke body)
    (request as any).user = decoded as JwtPayload;

    next();
  } catch (error) {
    response.status(400).json({
      message: `Token invalid : ${error}`,
    });
    return;
  }
};

export const verifyRole = (allowedRoles: string[]) => {
  return (request: Request, response: Response, next: NextFunction) => {
    const user = (request as any).user; // Ambil dari 'request.user'

    if (!user) {
      response.status(403).json({
        message: `There's no user information available`,
      });
      return;
    }

    if (!allowedRoles.includes(user.role)) {
      response.status(403).json({
        message: `Access denied. Requires one of the existing roles : ${allowedRoles.join(
          " "
        )}`,
      });
      return;
    }

    next();
  };
};
