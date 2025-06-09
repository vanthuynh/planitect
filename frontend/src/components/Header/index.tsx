"use client";
import { useAppSelector } from "@/app/redux";
import React from "react";

type Props = {
  name: string;
  buttonComponent?: any;
  isSmallText?: boolean;
};

const Header = ({ name, buttonComponent, isSmallText = false }: Props) => {
  const isDarkMode = useAppSelector((state) => state.global.isDarkMode);
  return (
    <div className="mb-5 flex w-full items-center justify-between">
      <h1
        className={`${isSmallText ? "text-lg" : "text-2xl"} dark-text-white font-semibold ${isDarkMode ? "text-white" : ""}`}
      >
        {name}
      </h1>
      {buttonComponent}
    </div>
  );
};

export default Header;
