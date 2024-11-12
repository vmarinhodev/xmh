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
            async ({ doc, previousDoc, req }) => {
                if (doc !== previousDoc){
                    console.log("Payload Change detected, sending revalidation request...", doc);
                }

                const { payload, transactionID } = req;

                if (transactionID) {
                    try {
                        await payload.db.commitTransaction(transactionID);
                        console.log('"Transaction committed successfully."')
                    } catch (error) {
                        console.error("Error commiting transaction: ", error);
                        return;
                    }
                }
                
                if (doc.layout !== previousDoc.layout) {
                    console.log(" doc", doc)
                    console.log("previousDoc", previousDoc)
                    try {
                        const response = await fetch(`${process.env.NEXT_PUBLIC_FRONTEND_URL}/api/revalidate?secret=${process.env.REVALIDATION_SECRET}&force=true`, {
                            method: 'POST',
                            headers: {
                                'Content-Type': 'application/json',
                            },
                            body: JSON.stringify({
                                paths: [`/${doc.slug}`],
                                secret: process.env.REVALIDATION_SECRET,
                            }),
                        });
    
                        const result = await response.json();
                        console.log("Revalidation result:", result);
                    } catch (error) {
                        console.error("Error revalidating:", error)
                    }
                }
            },
        ],
    },
};