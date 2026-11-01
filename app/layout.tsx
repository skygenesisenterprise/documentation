import { RootProvider } from "fumadocs-ui/provider/next";
import "./global.css";
import SearchDialog from "@/components/SearchDialog";
import { NotployTraffic } from "@/components/NotployTraffic";
import type { Metadata } from "next";
import { Inter } from "next/font/google";

const inter = Inter({
	subsets: ["latin"],
});

export const metadata: Metadata = {
	metadataBase: new URL(
		process.env.NEXT_PUBLIC_APP_URL || "https://docs.skygenesisenterprise.com",
	),
	title: {
		default: "Sky Genesis Enterprise Documentation",
		template: "%s | Sky Genesis Enterprise Documentation",
	},
	description:
		"Open Source Alternative to Vercel, Netlify and Heroku. Deploy your applications with ease.",
	keywords: [
		"skygenesisenterprise",
		"deployment",
		"docker",
		"hosting",
		"devops",
		"open source",
	],
	authors: [{ name: "Sky Genesis Enterprise Team" }],
	openGraph: {
		title: "Sky Genesis Enterprise Documentation",
		description: "Open Source Alternative to Vercel, Netlify and Heroku",
		type: "website",
	},
};

export default function Layout({ children }: LayoutProps<"/">) {
	return (
		<html lang="en" className={inter.className} suppressHydrationWarning>
			<body className="flex flex-col min-h-screen">
				{/* Traffic Manager instrumentation (no-op without the env vars). */}
				<NotployTraffic />
				<RootProvider
					search={{
						SearchDialog,
					}}
				>
					{children}
				</RootProvider>
			</body>
		</html>
	);
}
