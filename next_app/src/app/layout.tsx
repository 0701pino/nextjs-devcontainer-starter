import "@/app/globals.css";

import Footer from "@/components/footer";
import Header from "@/components/header";

import type { Metadata } from "next";

const RootLayout: React.FC<{ children: React.ReactNode }> = ({ children }) => {
  return (
    <html lang="ja">
      <body>
        <div className="mx-auto flex min-h-screen w-full flex-col lg:w-4/5">
          <Header />
          <main className="flex-grow">
            <div>{children}</div>
          </main>
          <Footer />
        </div>
      </body>
    </html>
  );
};

export default RootLayout;
