import "@/app/globals.css";

import Footer from "@/components/footer";
import Header from "@/components/header";

import type { Metadata } from "next";

const RootLayout: React.FC<{ children: React.ReactNode }> = ({ children }) => {
  return (
    <div className="flex flex-col min-h-screen w-full lg:w-4/5 mx-auto">
      <Header />
      <main className="flex-grow">
        <div>{children}</div>
      </main>
      <Footer />
    </div>
  );
};

export default RootLayout;
