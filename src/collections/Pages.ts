import { Hero } from "@/blocks/Hero";
import { TwoColumn } from "@/blocks/TwoColumn";
import { CollectionConfig } from "payload";

export const Pages: CollectionConfig = {
    slug: 'pages',
    labels: {
        singular: 'Page',
        plural: 'Pages',
    },
    access: {
        read: () => true,
    },
    fields: [
        {
            name: 'name',
            label: 'Name',
            type: 'text',
            required: true,
        },
        {
            name: 'slug',
            label: 'slug',
            type: 'text',
            required: true,
        },
        {
            name: 'layout',
            label: 'Layout',
            type: 'blocks',
            blocks: [
                // Blocks
                Hero,
                TwoColumn,
            ]
        }
    ],
    hooks: {
        afterChange: [
            async ({ doc }) => {
                console.log("AfterChange Hook Triggered for document:", doc);
                const pathsToRevalidate = [`/${doc.slug}`];
                try {
                    const response = await fetch(`${process.env.NEXT_PUBLIC_FRONTEND_URL}/api/revalidate?secret=${process.env.REVALIDATION_SECRET}`, {
                        method: 'POST',
                        headers: {
                            'Content-type': 'application/json',
                        },
                        body: JSON.stringify({
                            paths: pathsToRevalidate,
                        }),
                    });

                    const result = await response.json();
                    console.log("Revalidation result:", result);
                } catch (error) {
                    console.error("Error revalidating:", error)
                }
            },
        ],
    },
};