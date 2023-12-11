import express from 'express';
import { AuthRoutes } from '../modules/auth/auth.route';
import { CustomerRoutes } from '../modules/customer/customer.route';
import { DriverRoutes } from '../modules/driver/driver.route';
import { ProfileRoutes } from '../modules/profile/profile.route';
import { QuoteRoutes } from '../modules/quote/quote.route';
import { ReviewRoutes } from '../modules/review/truck.route';
import { TruckRoutes } from '../modules/truck/truck.route';
import { UserRoutes } from '../modules/user/user.route';

const router = express.Router();

const moduleRoutes = [
  {
    path: '/auth',
    route: AuthRoutes,
  },
  {
    path: '/profile',
    route: ProfileRoutes,
  },
  {
    path: '/users',
    route: UserRoutes,
  },
  {
    path: '/trucks',
    route: TruckRoutes,
  },
  {
    path: '/quotes',
    route: QuoteRoutes,
  },
  {
    path: '/drivers',
    route: DriverRoutes,
  },
  {
    path: '/customers',
    route: CustomerRoutes,
  },
  {
    path: '/reviews',
    route: ReviewRoutes,
  },
];

moduleRoutes.forEach(module => router.use(module.path, module.route));
export const applicationRoutes = router;
