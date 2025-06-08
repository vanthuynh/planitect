import { Router } from "express";
import { getProjects } from "../controllers/projectController";

const router = Router();

router.get("/", getProjects); // use route list from separate files, and make GET request using getProjects logic

export default router;
